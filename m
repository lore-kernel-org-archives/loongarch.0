Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E24F15495
	for <loongarch@lists.linux.dev>; Tue,  8 Aug 2023 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6eKGWV+qXBOmXib4CH5Q5ZonD3D+jdcD2iPRNMQYDUk=; b=a3g8FEOddyrqjCqTRZ1q+zPw7z
	fkLukIqE640YENNCXDa8maIEuKT2w71FPQ2faM0KUkRDtkJVGLEFUd3RBRGFOPYWKyH6cVq36oTYm
	kZJV8HgqNXCMieknQrGI397rm6F2V+TGepvWdhRDPsrJBzLFg6dj7AsdyA39J3lCdNupkftNuKekA
	LEd9qgfK8OxNusous4QBhGmmB7oCa5IX0c6mmFxkuKqaobANr1GIcg3hgt4Otl/XSBdCtj6jdJuwG
	Oez1iaXSEW/LfZBIakcEQbbDXE0qt0HZU8Eban0MerDMozdKZNVePY60Mm7VRNrGGv93+TlEf/b78
	rNxcd2ew==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qTTni-003Se7-0L;
	Tue, 08 Aug 2023 20:59:34 +0000
Message-ID: <3c11047c-0ef7-2316-6d77-70aca59b555d@infradead.org>
Date: Tue, 8 Aug 2023 13:59:33 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] LoongArch: Remove redundant "source
 drivers/firmware/Kconfig"
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 linux-kernel@vger.kernel.org
References: <20230808075505.2481-1-xry111@xry111.site>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230808075505.2481-1-xry111@xry111.site>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/8/23 00:55, Xi Ruoyao wrote:
> In drivers/Kconfig, drivers/firmware/Kconfig is sourced for all ports so
> there is no need to source it in the port-specific Kconfig file.  And
> sourcing it here also caused the "Firmware Drivers" menu appeared two
> times: once in the "Device Drivers" menu, another time in the toplevel
> menu.  This was really puzzling.
> 
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/loongarch/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index e71d5bf2cee0..465759f6b0ed 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -662,5 +662,3 @@ source "kernel/power/Kconfig"
>  source "drivers/acpi/Kconfig"
>  
>  endmenu
> -
> -source "drivers/firmware/Kconfig"

-- 
~Randy
