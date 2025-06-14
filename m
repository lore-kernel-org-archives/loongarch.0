Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28DC1EEE0
	for <loongarch@lists.linux.dev>; Sat, 14 Jun 2025 00:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861701; cv=none; b=KJkEWBLHFWkwX/Bi8qIinetaJLhlEwzC0aYdgt2vSOVCxDZi4i/mIBEEHtDOcWIiMJjViZeQRUZbzWbJdOTHovCXTVzidz6t/9z9X/jC5SdwV/karwuFXmii+IJ3yYey++zPjMxwazq1tI23TmzE161/hfrMAhX6mlBspYT+jNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861701; c=relaxed/simple;
	bh=N1MFp6BCI3TIq2cvJeasttvs0xi1dLDQjQSO3Bd4Zrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY5OOLSf/brCBi0bt49n24wmfeO3laysxx+ILTzti0l6qzFq7h2bfMS7sjdknldsTz11seS/udSZOIQk5LtcszBomsA4IFUdUSaWuGE+rYJ3TjRmue930O0ZucrNuPrLlZB427HvRQ6Ck2vgyrPYAHntnd7gQCAFEIGwT/G/cq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=elgWoCRx; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="elgWoCRx"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-735a53ef4feso1618503a34.0
        for <loongarch@lists.linux.dev>; Fri, 13 Jun 2025 17:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1749861699; x=1750466499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5NgXkXYPRuWbOpiUNMO6HgoGZd6uy5e0WlDRwFP97E=;
        b=elgWoCRxkutKEqDhaxNbW9ylBEJJw11DAEi5RUgH7Qjae367kM8jJTvQk3QLxRdpgL
         E9qITgkRhlkTzhTKJaFds941eqWuw1Ct++/5nWrNtwMHUptnt4UY7KDw4MFcubGnssUh
         /3MswEv2NcKx7MXw0101hTGtqQ5vDDV5acomyEbcaPuXglNk5HMSbSj7mcQUQbpOY6D/
         i3L+SpwEAYv/ANCTvlo8WW72y+Lc2LvgoAI9ue2jTaSMN9CE6JdT3RnIAwp+x6ZexKFh
         oKXiMsMJj3QU7BPliNXnJu9KMR4CSnPHioSFZ75AoUva5AkV3ve6jW5UMVQcUEXSfdkD
         /2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749861699; x=1750466499;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5NgXkXYPRuWbOpiUNMO6HgoGZd6uy5e0WlDRwFP97E=;
        b=b9wtEpX5qlJLedlnVjsfx7mInZK0eRbbn/DbRRqePAf775WT3OEYWfmS9U021x3cC0
         DoSDKJrHXW2+kdgXx3vbGfBcalhIDNERJ5nXdm2GNzCaXctG5B1Q2D6LP0JVYyNgklKO
         PJasMurud7CoXKIfbGc5mgUCSsxgk8e9PmpGgFr9F2qC/2z34m2pAFvBhkXCTHvi6smB
         HKNFeThsfBDJy1xmGMpe4m7/bPtUsBuNQ0NCysl3ttM1HpvqEFLDJJYeYVrL9KLI6rud
         cFaKVB1d7TttsHW4wPXcjsgas6rOcIZwc+Tif9hrQbqFAkqdb7EIyg8XqewAq6R7n3q2
         7M6g==
X-Forwarded-Encrypted: i=1; AJvYcCXmrpBjGHe2ZIpcX8k3gO5thJB4sdoz6IfYbxSEUzRwi3PDnWxXiKa8o3SbcLXTZnGDxjA6bbaq6jI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk9G1cAGQDlVhV6+oy22PKysTU2eYhcZWcOrWQLrSMM4Vkq40x
	MVC6dUVW6LMh0iLr70A0krN/t3prW1MfGEu+pY4EI52HfBA7uRRSxenrKfm1ROju1nM=
X-Gm-Gg: ASbGncvxQVXDzfEHIitQxHgVEoBOxkP/XQQ01B1zHzOpddR6zyoGd8YOZSYDhmxSyWf
	SPguSQPRM1gt1bHZtPw9fwWW3LgsZS9p6T3CAgFLjaGTiPVYVRSs+1A47hLLX3GPpEiY6PDGaED
	IonY8agcNKGH2SHPcNdnCrsRhp1t5mZbcCixc72xA2n9ILnrFU7xmtS/veT96eI9qh9SCMu3vkn
	gPfCPUorwWMf1zBKPDEQU/58bia0azfvpRd7Z9eVeoWaP6+20TYDwh4sHnvXBd2swVlpf0oyPVH
	7/7MkRP+goUJSbmwPFVVVEuPER0WgSwnjC+GHX/9L4Qpqb0W2dFRR16dxA/LawJ+Mg==
X-Google-Smtp-Source: AGHT+IH4htV1XZAM2fhjqi+RYSUf/curz1PkLjtyD8jI7j76IZ4AV/PeMuWUKVsn6dUMPlbPKxtGjg==
X-Received: by 2002:a05:6830:2c06:b0:72c:320c:d898 with SMTP id 46e09a7af769-73a363f5a90mr1189572a34.22.1749861698810;
        Fri, 13 Jun 2025 17:41:38 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f41f:8468:bca8:a5f7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28403c08sm402940a34.25.2025.06.13.17.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 17:41:38 -0700 (PDT)
Date: Fri, 13 Jun 2025 19:41:33 -0500
From: Corey Minyard <corey@minyard.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com
Subject: Re: [PATCH v4 0/3] LoongArch: Add Loongson-2K BMC support
Message-ID: <aEzFPdYEvbkaH_B5@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1749731531.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749731531.git.zhoubinbin@loongson.cn>

On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> Hi all:
> 
> This patch set introduces the Loongson-2K BMC.
> 
> It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> And it is a multifunctional device (MFD), such as display as a sub-function
> of it.

I've asked this before, but I haven't gotten a answer, I don't think.

Is this really a multi-function device?  Is there (or will there be)
another driver that uses the MFD code?

If nothing else is going to use this, then it's really not a
multi-function device and all the code can go into the IPMI directory.
That simplifies maintenance.

If it is a multi-function device, then I want two separate Kconfig
items, one for the MFD and one for the IPMI portion.  That way it's
ready and you don't have to bother about the IPMI portion when
adding the other device.

All else looks good, I think.

-corey

> 
> For IPMI, according to the existing design, we use software simulation to
> implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> 
> Also since both host side and BMC side read and write kcs status, we use
> fifo pointer to ensure data consistency.
> 
> For the display, based on simpledrm, the resolution is read from a fixed
> position in the BMC since the hardware does not support auto-detection
> of the resolution. Of course, we will try to support multiple
> resolutions later, through a vbios-like approach.
> 
> Especially, for the BMC reset function, since the display will be
> disconnected when BMC reset, we made a special treatment of re-push.
> 
> Based on this, I will present it in four patches:
> patch-1: BMC device PCI resource allocation.
> patch-2: BMC reset function support
> patch-3: IPMI implementation
> 
> Thanks.
> 
> -------
> V4:
> - Add Reviewed-by tag;
> - Change the order of the patches.
> Patch (1/3):
>   - Fix build warning by lkp: Kconfig tristate -> bool
>     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
>  - Update commit message;
>  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
>    Makefile.
> Patch (2/3):
>   - Remove unnecessary newlines;
>   - Rename ls2k_bmc_check_pcie_connected() to
>     ls2k_bmc_pcie_is_connected();
>   - Update comment message.
> Patch (3/3):
>   - Remove unnecessary newlines.
> 
> Link to V3:
> https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongson.cn/
> 
> V3:
> Patch (1/3):
>  - Drop "MFD" in title and comment;
>  - Fromatting code;
>  - Add clearer comments.
> Patch (2/3):
>  - Rebase linux-ipmi/next tree;
>  - Use readx()/writex() to read and write IPMI data instead of structure
>    pointer references;
>  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
>  - Drop unused output.
> Patch (3/3):
>  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pdata_initial();
>  - Add clearer comments.
>  - Use proper multi-line commentary as per the Coding Style documentation;
>  - Define all magic numbers.
> 
> Link to V2:
> https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongson.cn/
> 
> V2:
> - Drop ls2kdrm, use simpledrm instead.
> Patch (1/3):
>  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
>  - Add resolution fetching due to replacing the original display
>    solution with simpledrm; 
>  - Add aperture_remove_conflicting_devices() to avoid efifb
>    conflict with simpledrm.
> Patch (3/3):
>  - This part of the function, moved from the original ls2kdrm to mfd;
>  - Use set_console to implement the Re-push display function.
> 
> Link to V1:
> https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongson.cn/
> 
> Binbin Zhou (3):
>   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
>   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
>   ipmi: Add Loongson-2K BMC support
> 
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmi_si.h      |   7 +
>  drivers/char/ipmi/ipmi_si_intf.c |   3 +
>  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
>  drivers/mfd/Kconfig              |  12 +
>  drivers/mfd/Makefile             |   2 +
>  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++++++++++
>  7 files changed, 699 insertions(+)
>  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
>  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> 
> 
> base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> -- 
> 2.47.1
> 
