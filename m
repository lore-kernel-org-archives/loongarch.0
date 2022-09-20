Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DFA5C
	for <loongarch@lists.linux.dev>; Tue, 20 Sep 2022 10:41:00 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=i3dzw7IIOk5L/GK5GNCYTnU+CGZp5Euk1yecdX9ILBKr9M3sYjsvPpiMNZhlzoFG3FO/pRkrHn8TAP2OktLsKiIxdO/vxPBabyTrG2k6aHDO9xZuRRbzT0Unj/M9Wn+ZusqUUhnQ3COoZagMhNuO12MSrg7nr+Nf5gbDHDIu5B7NToMcA7dfnjY/gUxvd8VPFIrfCzwIxTWjvrN1Xm77j6ECo1+/1oszcV+GE/qQhukL8Bemw/klOR09WSdrEq1Gkgj7e8u/r3BMN4pkufQRpZ7qBV5SimsL3nmWzlP4DrdWxNs7HFust6yOrFihQfWGaoolNf+VxPbh3Bd42xkumA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1VE4KHm5LKJpGcVCtOeOsiJCnSS6xSG0ULB8UARk1s=;
 b=Mhjwq5CDsQ3VYMXJO9vZzb48QSnu8/aCQoFzbysjiPS+ayug67eCgysB4rJTOTcs6vkYU5DpEjOEMqNCWDFASooAp/tws6DAypCkxWWT6qT6mq78/j7EGrXoSY/zQX9tQmgBTDY5Xuk0L19aoxF2PypNrRFlxDIBz8S/p8mCWyGADYK0ZgP0o61rEF7E0yZXdIzsuWVUTUexie7ZzJ4yV/gdSv5U2uk7w32WcUE8RZwYrdylu29U2azRxeJbazYYDF81041csuGU2KsW2p+GgWpLy26XKi8miARCYvC9telddC50iXAOxCokHtayE8wGeLQviKfeXfH1iX9TECFa2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1VE4KHm5LKJpGcVCtOeOsiJCnSS6xSG0ULB8UARk1s=;
 b=s+39pgOQkufgrbxX7fqC6l9xNxmCBQ307Twk9LPKNZZkL+jSA7PFiahDoLPSXtJ1NtipYuQw0whdQTXERf0O9t81jRFPwN9w0u3ed404eUbfHK3Lw0gox2hCSDfOGieiAZoHMGZVAVHusKZBSYZ2K/NLXV+84s27kRvkj5huTeE=
Received: from FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::23)
 by DU0PR08MB8469.eurprd08.prod.outlook.com (2603:10a6:10:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Tue, 20 Sep
 2022 10:40:57 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::f6) by FR0P281CA0018.outlook.office365.com
 (2603:10a6:d10:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 10:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 10:40:56 +0000
Received: ("Tessian outbound 0a0431bdcdb4:v124"); Tue, 20 Sep 2022 10:40:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8eb7809dc28f0dd0
X-CR-MTA-TID: 64aa7808
Received: from 5421c198e05f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EA07C578-4A8A-419F-BB66-D3D89975B302.1;
	Tue, 20 Sep 2022 10:40:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5421c198e05f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Sep 2022 10:40:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSf+Ut58NyqB1ecm0I8PFsLnLZ6MwPoh05lhXtp6iHiUS9cxQ4TatiWuhaSDPnmsrI4vzSIjVzqBiC542jRP5wzahEKLlSygs6qPlelU/T79wJwhtq46G+s9mpsHAnL1nbx2icCGkuoncpYNMdjf/uBTpMma7iu3P81a82cR5FlcyoZWwtpiGcLRJaaemBYQIm7a6crRAO732jUF3gsxmZ4OaRfyURzanfpzds5wfdPTWf1py/T/d2/ZUKSbz7PMUzIigI4kp3OO23OSqIYCXAaf6CREgs9LibKV7iPOWlD1p4mAxGnjQusRKcbp0W9km2ngKiXn0h6mLj2JBHwXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1VE4KHm5LKJpGcVCtOeOsiJCnSS6xSG0ULB8UARk1s=;
 b=jEs3+j5rfpeTdxq1iajlCGH94y/7JgfjIqpvr1wFs+dWT3FVC/YgSkZpVgodl2k9MthppT8b9mMctPQkkBGPsEb9BCn6jUVXierkhJX4kjbWjv35fYpuLHF0cWVjDsr1DqVBk4+QvXRbGaCBR+od+YAYQVb/EQh6Jo9+blSo+Z5fB61qGqkhrsbYRHc3YJyuWje836Tla40+ZcoJJLuQsnB3QNXNlEY4+VheG3sf2L/XXhuAxF1v8CceQxgeBkLvCvCvZnlsoemsW8PNkVYA0fSgsitPaEN9hb8fJ67xS0SvTP4jF68jAMtIz0PeoNWg7oiBeO6SLwne+Sz/+H8RFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1VE4KHm5LKJpGcVCtOeOsiJCnSS6xSG0ULB8UARk1s=;
 b=s+39pgOQkufgrbxX7fqC6l9xNxmCBQ307Twk9LPKNZZkL+jSA7PFiahDoLPSXtJ1NtipYuQw0whdQTXERf0O9t81jRFPwN9w0u3ed404eUbfHK3Lw0gox2hCSDfOGieiAZoHMGZVAVHusKZBSYZ2K/NLXV+84s27kRvkj5huTeE=
Received: from DB7PR05CA0063.eurprd05.prod.outlook.com (2603:10a6:10:2e::40)
 by GV1PR08MB7330.eurprd08.prod.outlook.com (2603:10a6:150:1d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 10:40:47 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::87) by DB7PR05CA0063.outlook.office365.com
 (2603:10a6:10:2e::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 10:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 10:40:47 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 20 Sep
 2022 10:40:47 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9 via Frontend
 Transport; Tue, 20 Sep 2022 10:40:46 +0000
Date: Tue, 20 Sep 2022 11:40:45 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: <linux-efi@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Ilias Apalodimas
	<ilias.apalodimas@linaro.org>, Huacai Chen <chenhuacai@loongson.cn>, Xi
 Ruoyao <xry111@xry111.site>, <nd@arm.com>
Subject: Re: [PATCH 09/12] efi: libstub: install boot-time memory map as
 config table
Message-ID: <20220920104045.GA18686@e124191.cambridge.arm.com>
References: <20220918213544.2176249-1-ardb@kernel.org>
 <20220918213544.2176249-10-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220918213544.2176249-10-ardb@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT048:EE_|GV1PR08MB7330:EE_|VE1EUR03FT005:EE_|DU0PR08MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 540b3bad-748a-4f40-1fe2-08da9af499b5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GlWaK+EOCB6kdqd835Ln9BOZh5hmcxl5KNkDXKKeWWYRyJJGHAvr2bCASHRbcxwC5ouUJpC6Q/zHMBb74xEKuPu68t4BY4Dl5wyYz/tvZp8UsGJKqJ5oGqvjVLKO+g6xmoj/lyQ8Y9oXmLdkcqSNvkZCbk6vIwdCmSA9swd6gjHoeEdoi1JCCSmFIimXLKO+lYEmSp2q2F6l4ROQaARbB0gwpSg1muJYlY6haeF8O4pkOpQhSl/NKPe5EhApwuu7W3uq+9C80I6viAeFaysDcOJ91CjWHYZ1e7BWBR1nSe/ApR3tJQ1o1l97+Z4EpiX6uftuBJiTXq1VrxCwy7eSINeJMzpy3zRPg/3ejptM7QFYUBbPmRuLhvDgWYiNyXTA1LHxifEXcyUloNQ+KMDkiSUR7syP6Qb/VtZ7TTa427/+JoIK5PtF3yR3AJ8I9TiK4OLCIG4JZ+ZFamc2NzWH9oqjxqyIwziuac/xu5eq6195W4fX92iBaUkH40zPqjXlTaoZ+FtKJlXvqtGOx7gSnFnh+cij3yaPzFkGK8iZi1W3872vwd2E9DdMDRr0ScxjNMBrIjBYP2rdiAupaZh2yNIvNUw3OGx2/dba5zkMZyiagUPbR58VGFmG0ZlqJ2VaA44jVryFdMCnnpem+lkerCJTR1PgY70CjpdTIjleDTKYHwvo+ncHBjS7DhkBrdPSx95mEHQCykz2kYHkT+/E4jYTZeN1DH8/91ZPGHQ5ttd9yDECR02kWEpt0mwN6Tt4Erue0pWH8IXNj0IGJQNLyuexX7LR7R62j8MEzaK14A4QOUJasci0UynU1MUOGYHx
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(6916009)(426003)(47076005)(336012)(54906003)(86362001)(83380400001)(356005)(40460700003)(36860700001)(82740400003)(7696005)(41300700001)(40480700001)(33656002)(81166007)(186003)(55016003)(26005)(478600001)(1076003)(316002)(44832011)(2906002)(5660300002)(70586007)(70206006)(8676002)(8936002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7330
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0366152e-268a-4c05-a969-08da9af4943b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ObYH4xgHvEpsuEs+XJEkCfdkSKfNhT+347kSy3zmC3COczt1bbqDB/T8KLFCdpmawq+V+TfWBuexokuCJ7b3EVYOdqRlqBHDbFSOyi7NC/lAHwwz6lkS/MqybU4YtY4W4tyWz+mCBjfxFNv5GdQPsYOVifwnkKmV3na6eT2VyWNS1lowwai8XGx2sidCLjfiw6jZvoJ2OdsF5Wq1MUeEYhmeckyiUQl/HjkomVfcYmogOB8iJ7qCIE5MyH+78J+wxHkKY5RpKr4nX2omeMDcy1rXioANHh8UmN+clOVE/5MNUCiEIIyH1jHSRd9yEi+YuBodUwzyZ6+4ofLimWRyJOPHbqdkXhSdNn842z85dxzIgqXbuPL1w6P1+cmKHjh0e8n2QI6TY9vECxchhEV2Xj45iVKIyu+ADmeNiDItOJYBUWAapyJ6axrJQlai9YYxdFcDKJnlCSTzUsWPjLe1xBOjwGKouvc6m5wTb3echDGO9SiG2ys/2eur8uujx+byAR4Vi07EZrG3S3V++I5/XJv9N0PmXVg5Hqc3mfzYZVl2+YhbbL9zdy8+7tESuJuzgDyXh2OuaNpI2dISWjeW0021WzHfZGlPHvjqvNJoayUebX5FqRZA5CKjhU1W/6a8cXCAEuJZ4XcI9VHm5oO1goEOdXsphCIGMHRoKitXhom6Le9nV+mndLkMDAwr9at9h81yNiiiL2ajGTx5kJwYON3uoolh7dv30oxxJMDGu8IP7MF3LIfj/kgwl+viZJQcmkO3NwbFhY/CKeN9WJcaaA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(2906002)(186003)(1076003)(336012)(83380400001)(33656002)(426003)(81166007)(82740400003)(316002)(70206006)(8676002)(70586007)(5660300002)(47076005)(86362001)(44832011)(6862004)(36860700001)(4326008)(8936002)(54906003)(7696005)(41300700001)(82310400005)(26005)(40480700001)(478600001)(40460700003)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 10:40:56.6734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 540b3bad-748a-4f40-1fe2-08da9af499b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8469

Hi Ard,

On Sun, Sep 18, 2022 at 11:35:41PM +0200, Ard Biesheuvel wrote:
> Expose the EFI boot time memory map to the kernel via a configuration
> table. This is arch agnostic and enables future changes that remove the
> dependency on DT on architectures that don't otherwise rely on it.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/firmware/efi/libstub/arm64-stub.c      |  2 +-
>  drivers/firmware/efi/libstub/efi-stub-helper.c |  2 +-
>  drivers/firmware/efi/libstub/efistub.h         |  3 ++-
>  drivers/firmware/efi/libstub/mem.c             | 26 ++++++++++++++++++--
>  drivers/firmware/efi/libstub/randomalloc.c     |  2 +-
>  drivers/firmware/efi/libstub/relocate.c        |  2 +-
>  include/linux/efi.h                            |  1 +
>  7 files changed, 31 insertions(+), 7 deletions(-)
> 
[..]
> diff --git a/drivers/firmware/efi/libstub/mem.c b/drivers/firmware/efi/libstub/mem.c
> index 40721573e494..ed4c145afe11 100644
> --- a/drivers/firmware/efi/libstub/mem.c
> +++ b/drivers/firmware/efi/libstub/mem.c
> @@ -9,14 +9,20 @@
>   * efi_get_memory_map() - get memory map
>   * @map:		pointer to memory map pointer to which to assign the
>   *			newly allocated memory map
> + * @install_cfg_tbl:	whether or not to install the boot memory map as a
> + *			configuration table
>   *
>   * Retrieve the UEFI memory map. The allocated memory leaves room for
>   * up to EFI_MMAP_NR_SLACK_SLOTS additional memory map entries.
>   *
>   * Return:	status code
>   */
> -efi_status_t efi_get_memory_map(struct efi_boot_memmap **map)
> +efi_status_t efi_get_memory_map(struct efi_boot_memmap **map,
> +				bool install_cfg_tbl)
>  {
> +	int memtype = install_cfg_tbl ? EFI_ACPI_RECLAIM_MEMORY
> +				      : EFI_LOADER_DATA;
> +	efi_guid_t tbl_guid = LINUX_EFI_BOOT_MEMMAP_GUID;
>  	struct efi_boot_memmap *m, tmp;
>  	efi_status_t status;
>  	unsigned long size;
> @@ -28,11 +34,23 @@ efi_status_t efi_get_memory_map(struct efi_boot_memmap **map)
>  		return EFI_LOAD_ERROR;
>  
>  	size = tmp.map_size + tmp.desc_size * EFI_MMAP_NR_SLACK_SLOTS;
> -	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, sizeof(*m) + size,
> +	status = efi_bs_call(allocate_pool, memtype, sizeof(*m) + size,
>  			     (void **)&m);
>  	if (status != EFI_SUCCESS)
>  		return status;
>  
> +	if (install_cfg_tbl) {
> +		/*
> +		 * Installing a configuration table might allocate memory, and
> +		 * this may modify the memory map. This means we should install
> +		 * the configuration table first, and re-install or delete it
> +		 * as needed.
> +		 */
> +		status = efi_bs_call(install_configuration_table, &tbl_guid, m);
> +		if (status != EFI_SUCCESS)
> +			goto free_map;
> +	}
> +
>  	m->buff_size = m->map_size = size;
>  	status = efi_bs_call(get_memory_map, &m->map_size, m->map, &m->map_key,
>  			     &m->desc_size, &m->desc_ver);
> @@ -40,6 +58,10 @@ efi_status_t efi_get_memory_map(struct efi_boot_memmap **map)
>  	if (status == EFI_SUCCESS) {
>  		*map = m;
>  	} else {
> +		if (install_cfg_tbl)
> +			efi_bs_call(install_configuration_table, &tbl_guid,
> +				    NULL);
> +free_map:
>  		efi_bs_call(free_pool, m);
>  	}

You have another commit about removing goto kludges, so maybe write this like the following,
rather than a goto into an 'else' statement?

diff --git a/drivers/firmware/efi/libstub/mem.c b/drivers/firmware/efi/libstub/mem.c
index feef8d4be113..2f22ef7c5232 100644
--- a/drivers/firmware/efi/libstub/mem.c
+++ b/drivers/firmware/efi/libstub/mem.c
@@ -64,10 +64,12 @@ efi_status_t efi_get_memory_map(struct efi_boot_memmap *map)
                        *map->key_ptr = key;
                if (map->desc_ver)
                        *map->desc_ver = desc_version;
-       } else {
-               efi_bs_call(free_pool, m);
        }
 
+free_map:
+       if (status != EFI_SUCCESS)
+               efi_bs_call(free_pool, m);
+
 fail:
        *map->map = m;
        return status;

(This is a diff against next-20220920, not your branch, but you get the idea)

Thanks,
Joey
