Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C723D7CD
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 02:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764210033; cv=none; b=IUoxU2vzoSnbuxSjXGp9Ae7Wh5wo4icSwXsJ3nNfDM9ETU/q3BBawl7DqtwuYawySazmZ2xYs3PCpm2Il1TcKRF2250JYbiPpvBY2l9sp63nIDzNVgVbrxTG+Ds9kUPRBCL2/kr8lal2ETkDN1I2qYHsd1A6fPwVczL3uSiir1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764210033; c=relaxed/simple;
	bh=O5+FwqoY/zKpG5o8W+7yvGXAPlP0E+ecret6xMCqLzA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tApxV50iEzEOpdL58ZlNrb6dn8M55X0VJmHtyqVxf3QmqltnlSbTZjwnBIf7WL1lVGhatczTNZHQp8BTrCvKF1o/7Tgs+HL4AfusgaSKImR40sxyWiuoMlWvjtsJl5dofDtquMG7ff94rc0uYfIta/AqabxbQrHg+JdvfT8ySqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OfkpIR8b; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OfkpIR8b"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477aa218f20so1667145e9.0
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 18:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764210029; x=1764814829; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=;
        b=OfkpIR8bxoHnj0xbTg+UpeMrm9+sJGb1c8W4d4i+Vvgy8JQXpwhpvgpyaJVx50MgYA
         iUlHgKx7u5hZABabJlFpV+irqhhRJftoYoJglv3L0+KQuuuz333AlW8W8REgU8rf7PZ1
         4kGAOdTuaI6VnRPXjrsPCJhQP1Wahdcj4d9JwtSyYh6Dab20XZmrlSe67/JeFzMdD3xX
         8hlVZNOGpUYzhIyUBxpubJRPprTRnrTiU4ozdApS+Eo9lu+ss3/H/vpMthh39ANI5TpY
         U6PyZHQeqSIj/ThIo3GTZeOiDmFdSnqsO0xDVaPyPz+aQK6s4THpCkT0orxK+Lys/hqK
         wv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764210029; x=1764814829;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=;
        b=Ev7v2wzcvAF6UbPzFj7YIGk9Lh4ZKOlt/D0TC/ecc5SOYkedp6TVwV+8wgDTaXJpot
         vf7hI5fTQz+670jIvjdezop46xU/LRZ0qqvqEA8hDwAMYWetHBSnGeX4bX8gGTApNetz
         OUBuPYojhEQ9CDX+JxXn7IqTSs1g1Nu+P+7ALyu5iJUJ7eXz6aPlUHPR4cnFyy/LwqKA
         jotovzDT35HmJ4ASn/1NG6iW9TsFgnB/aoDbDXzkuekRyWMrmIzzfq17p3IVbGKxcE6/
         VcSF7unU70ZqQXWjja0I9T5BAZ9KvhDn6jUNIc+r76qFCBMBqLrXS+lQDuQ9v3koVWrz
         a/8A==
X-Forwarded-Encrypted: i=1; AJvYcCU/covt6ZvWxCccLrL5p/u255DHBZjktWGrrcDhnwyk6iD4IIUudUj+gR04vc7PoVHe3mi9Q6ediqc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8ei2nLl7QSw+NvUVDJAbmd+kQZY0IhPPcvP6lc2ZDhLxn/tvO
	MIpp8UwPs3ELp48kmgwOF2hQ4JdNVELX34w/5uJ7bs1A/N4Na+wh4DmY95S1GUfNJEo=
X-Gm-Gg: ASbGncvoAcZTuOvbgAti4Z0zRBqr4iV3W3QOpFkIBEoWj34xTGvYAaDYW8GEGWxzs4a
	Z28BshdE6tD9ZaZZnTOWnV3lJ/paJCMvCnWMMVkOTy0WsyLpm4f9D4C5giSlH0mHJQwl9SIHXD9
	vtl2zWDcMbVk6/y8ZEMNKR2mIrl8li4ityBRTWgIU6TfSVdn3+Z/+izIvjf10RfsiZRZOCnEMkk
	mBYnDewdHFNEG8+OwfWkLvmqyjhdHiO2J2FSIJr9AjGdYz0wVI9d/USnh1Xq4wLS7rjrx4zDWrQ
	czQhp8bu65l3vzvy2ZQCP2rgeyBFx7DZll0LRIJQ0BkEnG3T+CT1QwTnGDC3zoMq++Ogu9XkZb3
	9R0EnGThKyj1acAq2mAcRVAVy6LGU4odpZZjc/4IcU3/JmEgCA3YST8n1B0zJFUNDTeMy/cc42W
	o+Eoc0xB6riCdA4gXKxVsCW6aHoJfMo0jS
X-Google-Smtp-Source: AGHT+IGspC1YV2yyiMXXnAe8/Td7EsFQhaqJU5qYzu5f0NQl+Us+ioM0vDMgGxEbw6PNx9+MNqPMRQ==
X-Received: by 2002:a05:600c:474b:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-477c01b494fmr204934695e9.19.1764210029052;
        Wed, 26 Nov 2025 18:20:29 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b20b5d6sm67743a91.6.2025.11.26.18.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 18:20:28 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 10:20:20 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI
 systems
Message-ID: <aSe1ZBXa3JBidhem@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Thomas,

I am attempting to test this patch series but encountered merge conflicts when applying it to various trees.
Could you please clarify the specific base commit (or branch/tag) this series was generated against?

When testing on the next branch on commits 7a2ff00 and e41ef37, I hit a conflict on PATCH v3 4/9:
patching file drivers/pci/vgaarb.c
Hunk #2 FAILED at 557.
1 out of 2 hunks FAILED -- rejects in file drivers/pci/vgaarb.c

When testing against 3a86608 (Linux 6.18-rc1), the following conflicts occurred:
patching file drivers/gpu/drm/sysfb/efidrm.c
Hunk #1 FAILED at 24.
1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/efidrm.c
patching file drivers/gpu/drm/sysfb/vesadrm.c
Hunk #1 FAILED at 25.
1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/vesadrm.c

Please let me know the correct base, and I will retest.

Thanks,
Richard Lyu

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users. Then implement EDID support
> in the kernel EFI code.
> 
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
> 
> Replacing both with sysfb_primary_display has been motivate by the EFI
> stub. EFI wants to transfer EDID via config table in a single entry.
> Using struct sysfb_display_info this will become easily possible. Hence
> accept some churn in architecture code for the long-term improvements.
> 
> Patches 1 and 2 reduce the exposure of screen_info in EFI-related code.
> 
> Patch 3 adds struct sysfb_display_info.
> 
> Patch 4 replaces scren_info with sysfb_primary_display. This results in
> several changes throught the kernel, but is really just a refactoring.
> 
> Patch 5 updates sysfb to transfer sysfb_primary_display to the related
> drivers.
> 
> Patch 6 moves edid_info into sysfb_primary_display. This resolves some
> drivers' reference to the global edid_info, but also makes the EDID data
> available on non-x86 architectures.
> 
> Patches 7 and 8 add support for EDID transfers on non-x86 EFI systems.
> 
> Patch 9 cleans up the config-table allocation to be easier to understand.
> 
> v3:
> - replace SCREEN_INFO table entry (Ard)
> - merge libstub patch into kernel patch
> v2:
> - combine v1 of the series at [1] plus changes from [2] and [3].
> 
> [1] https://lore.kernel.org/dri-devel/20251121135624.494768-1-tzimmermann@suse.de/
> [2] https://lore.kernel.org/dri-devel/20251015160816.525825-1-tzimmermann@suse.de/
> [3] https://lore.kernel.org/linux-efi/20251119123011.1187249-5-ardb+git@google.com/
> 
> Thomas Zimmermann (9):
>   efi: earlycon: Reduce number of references to global screen_info
>   efi: sysfb_efi: Reduce number of references to global screen_info
>   sysfb: Add struct sysfb_display_info
>   sysfb: Replace screen_info with sysfb_primary_display
>   sysfb: Pass sysfb_primary_display to devices
>   sysfb: Move edid_info into sysfb_primary_display
>   efi: Refactor init_primary_display() helpers
>   efi: Support EDID information
>   efi: libstub: Simplify interfaces for primary_display
> 
>  arch/arm64/kernel/image-vars.h                |  2 +-
>  arch/loongarch/kernel/efi.c                   | 38 ++++-----
>  arch/loongarch/kernel/image-vars.h            |  2 +-
>  arch/riscv/kernel/image-vars.h                |  2 +-
>  arch/x86/kernel/kexec-bzimage64.c             |  4 +-
>  arch/x86/kernel/setup.c                       | 16 ++--
>  arch/x86/video/video-common.c                 |  4 +-
>  drivers/firmware/efi/earlycon.c               | 42 +++++-----
>  drivers/firmware/efi/efi-init.c               | 46 ++++++-----
>  drivers/firmware/efi/efi.c                    |  4 +-
>  drivers/firmware/efi/libstub/Makefile         |  2 +-
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 36 +++++++--
>  drivers/firmware/efi/libstub/efi-stub.c       | 49 +++++++----
>  drivers/firmware/efi/libstub/efistub.h        |  7 +-
>  .../firmware/efi/libstub/primary_display.c    | 41 ++++++++++
>  drivers/firmware/efi/libstub/screen_info.c    | 53 ------------
>  drivers/firmware/efi/libstub/zboot.c          |  6 +-
>  drivers/firmware/efi/sysfb_efi.c              | 81 ++++++++++---------
>  drivers/firmware/sysfb.c                      | 13 +--
>  drivers/firmware/sysfb_simplefb.c             |  2 +-
>  drivers/gpu/drm/sysfb/efidrm.c                | 14 ++--
>  drivers/gpu/drm/sysfb/vesadrm.c               | 14 ++--
>  drivers/hv/vmbus_drv.c                        |  6 +-
>  drivers/pci/vgaarb.c                          |  4 +-
>  drivers/video/Kconfig                         |  8 +-
>  drivers/video/fbdev/core/fbmon.c              |  8 +-
>  drivers/video/fbdev/efifb.c                   | 10 ++-
>  drivers/video/fbdev/vesafb.c                  | 10 ++-
>  drivers/video/fbdev/vga16fb.c                 |  8 +-
>  drivers/video/screen_info_pci.c               |  5 +-
>  include/linux/efi.h                           |  9 ++-
>  include/linux/screen_info.h                   |  2 -
>  include/linux/sysfb.h                         | 23 ++++--
>  include/video/edid.h                          |  4 -
>  34 files changed, 321 insertions(+), 254 deletions(-)
>  create mode 100644 drivers/firmware/efi/libstub/primary_display.c
>  delete mode 100644 drivers/firmware/efi/libstub/screen_info.c
> 
> 
> base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
> -- 
> 2.51.1
> 
