Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4EE3ED136;
	Wed,  6 May 2026 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079024; cv=none; b=EPuHucKjnhs7li0MXTJzOkNoE90f0EuT4WsfxWRDC/+/3dxG9AZzh8EoG7bIQ+mqFOeGnFGAl1uI9AkxAdXt5Kx9kmpTUnUjOWfil/r3PBYUlsThBEC254F1Ntkicsu48xfsjDpjs3frTseqMGBsYq9zc+ftcsdMg6H6SCWOcVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079024; c=relaxed/simple;
	bh=CZrArw/oj5KuHDK0tXBG7dLbv82g9Q+f39sVJuaaXGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoE2vSW6ATKfJnfn2IDTASZkXWaB4SrTjkeimEaf8vaM4OuqMbC8isslcSunUwhnX26WZ2iJayTNG8n+R/j//ScaCVMOIaDT7CLhuZAHGoNsUfzSjhuhBXe/x0HbWfvNtaHRS6EKgrkV7/F8Fk5lK6wc6QKvSx3VyUQln2d+NAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6TUxV34; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6TUxV34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0ADC2BCB0;
	Wed,  6 May 2026 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778079024;
	bh=CZrArw/oj5KuHDK0tXBG7dLbv82g9Q+f39sVJuaaXGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6TUxV34XzI+ncRRf/mLg+KIaFrcYHGltCpfI6F9PLZtKGMDFzHlEA+6uzHO1W/Ff
	 PuipwjSYswUif3oyWQyRzZ985ozzFxYPVJAr7+dWyHDP2Am/kO0owTKxjP1hGgUlJ8
	 f5IfHPQOEbID0Ndb0UdMoS35ufyK8ucGEdz6QhylU9g+1Bhsc2ThDYKGw5ncod6vRB
	 5Mxxaqvg8h705i+G0A9OldBOWs/rtfAoxjWdFtOKLb21H8M+6dC1GP9zhEyFJoYOjS
	 4rImJsWyBPDPqBkbm22VTED8BEP8k8B/Ttl9xuhcH887xrMHSQ6OuJAZTqRv1rUxjh
	 tmx8iwFEkEJvA==
Date: Wed, 6 May 2026 09:50:22 -0500
From: Rob Herring <robh@kernel.org>
To: Chen Wandun <chenwandun1@gmail.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, akpm@linux-foundation.org,
	bhe@redhat.com, rppt@kernel.org, pasha.tatashin@soleen.com,
	pratyush@kernel.org, ruirui.yang@linux.dev, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, saravanak@kernel.org,
	chenwandun@lixiang.com, zhaomeijing@lixiang.com, everyzhao@126.com
Subject: Re: [PATCH 07/11] of: reserved_mem: add no-dump crash_mem exclusion
 helpers
Message-ID: <20260506145022.GA2084721-robh@kernel.org>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-8-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065831.1510858-8-chenwandun@lixiang.com>

On Wed, Apr 29, 2026 at 02:58:27PM +0800, Chen Wandun wrote:
> Provide two kdump-oriented helpers so that arch kexec_file code does
> not have to open-code the no-dump filtering loop:
> 
>  - of_reserved_mem_no_dump_nr_ranges() returns the number of reserved
>    regions flagged with linux,no-dump. Each exclusion may split one
>    existing crash_mem range into two, so callers use this count to
>    pre-size their crash_mem allocation.
> 
>  - of_reserved_mem_exclude_no_dump() walks the reserved_mem[] array
>    and calls crash_exclude_mem_range() for each no-dump region.
> 
> Both helpers are guarded by CONFIG_KEXEC_FILE; empty inline stubs are
> provided for the !KEXEC_FILE case so architecture code can call them
> unconditionally.
> 
> The consumers are added in the following arm64, riscv and loongarch
> patches in this series.
> 
> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
> ---
>  drivers/of/of_reserved_mem.c    | 54 +++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h | 15 +++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 4b80420da2d2..038056a6408a 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -27,6 +27,10 @@
>  
>  #include "of_private.h"
>  
> +#ifdef CONFIG_KEXEC_FILE
> +#include <linux/crash_core.h>
> +#endif

You shouldn't need ifdef around includes.

> +
>  static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
>  static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
>  static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
> @@ -916,6 +920,56 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
>  
> +#ifdef CONFIG_KEXEC_FILE

Use 'if (IS_ENABLED())' within the function.

> +/**
> + * of_reserved_mem_no_dump_nr_ranges() - count reserved regions flagged
> + * with the linux,no-dump property.
> + *
> + * Each such region may split an existing crash_mem range into two when
> + * it is excluded, so callers can use this count to pre-size their
> + * crash_mem allocation.
> + */
> +unsigned int of_reserved_mem_no_dump_nr_ranges(void)
> +{
> +	unsigned int i, n = 0;
> +
> +	for (i = 0; i < reserved_mem_count; i++)
> +		if (reserved_mem[i].no_dump)
> +			n++;
> +	return n;
> +}
> +
> +/**
> + * of_reserved_mem_exclude_no_dump() - exclude no-dump reserved regions
> + * from a crash_mem list.
> + * @cmem: crash memory list to modify
> + *
> + * Walks the reserved_mem[] array and calls crash_exclude_mem_range() for
> + * every region with no_dump set. Intended to be called from arch kdump
> + * code when constructing the elfcorehdr.
> + *
> + * Returns 0 on success, or a negative error returned by
> + * crash_exclude_mem_range() on the first failure.
> + */
> +int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < reserved_mem_count; i++) {
> +		struct reserved_mem *r = &reserved_mem[i];
> +
> +		if (!r->no_dump || !r->size)
> +			continue;
> +		ret = crash_exclude_mem_range(cmem, r->base,
> +					      r->base + r->size - 1);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +#endif /* CONFIG_KEXEC_FILE */
