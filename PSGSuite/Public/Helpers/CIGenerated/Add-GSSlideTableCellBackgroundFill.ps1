function Add-GSSlideTableCellBackgroundFill {
    <#
    .SYNOPSIS
    Creates a Google.Apis.Slides.v1.Data.TableCellBackgroundFill object.

    .DESCRIPTION
    Creates a Google.Apis.Slides.v1.Data.TableCellBackgroundFill object.

    .PARAMETER PropertyState
    Accepts the following type: string

    .PARAMETER SolidFill
    Accepts the following type: Google.Apis.Slides.v1.Data.SolidFill

    .EXAMPLE
    Add-GSSlideTableCellBackgroundFill -PropertyState $propertyState -SolidFill $solidFill
    #>
    [OutputType('Google.Apis.Slides.v1.Data.TableCellBackgroundFill')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [string]
        $PropertyState,
        [parameter()]
        [Google.Apis.Slides.v1.Data.SolidFill]
        $SolidFill,
        [parameter(Mandatory = $false,ValueFromPipeline = $true,ParameterSetName = "InputObject")]
        [Google.Apis.Slides.v1.Data.TableCellBackgroundFill[]]
        $InputObject
    )
    Process {
        try {
            switch ($PSCmdlet.ParameterSetName) {
                Fields {
                    $obj = New-Object 'Google.Apis.Slides.v1.Data.TableCellBackgroundFill'
                    foreach ($prop in $PSBoundParameters.Keys | Where-Object {$obj.PSObject.Properties.Name -contains $_}) {
                        switch ($prop) {
                            default {
                                $obj.$prop = $PSBoundParameters[$prop]
                            }
                        }
                    }
                    $obj
                }
                InputObject {
                    foreach ($iObj in $InputObject) {
                        $obj = New-Object 'Google.Apis.Slides.v1.Data.TableCellBackgroundFill'
                        foreach ($prop in $iObj.PSObject.Properties.Name | Where-Object {$obj.PSObject.Properties.Name -contains $_ -and $_ -ne 'ETag'}) {
                            $obj.$prop = $iObj.$prop
                        }
                        $obj
                    }
                }
            }
        }
        catch {
            if ($ErrorActionPreference -eq 'Stop') {
                $PSCmdlet.ThrowTerminatingError($_)
            }
            else {
                Write-Error $_
            }
        }
    }
}
