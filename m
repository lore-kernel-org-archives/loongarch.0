Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867584FCC
	for <loongarch@lists.linux.dev>; Fri, 24 May 2024 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556673; cv=none; b=B2O3eWl0njThPdNzl7k+RO4dG8MaeXuSnZCk58vTtJjs9mu5BtIuxhl4UGT54yfn4doZe2cW17sMc+lwy8soT5cDdRGuN3u5/0gGDfM2g57Igio7UJ3Tii4eX8LM3zjlgJLg+Wmyg+XQr0MhCfajfMzTd2vcU3mYiKhADKeWQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556673; c=relaxed/simple;
	bh=SlXCQc3o/MB52ttkYbUWNblq+v3TZ5Rf15VGTVZLLpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1gMXfimHbMWeLHOYM4jBkEvKaESgF50b7U/snP1Jhax+CmsBK0ARc1cvPfZuoV1gfd/7KWw0b23ZnO7WLKWWF1sOMgM5B4Mz2u5scY6QQOxWG3rbAgns9qEliCP1lwpaQtDSSpHPLx6p+3jCi1d28eZaNCfpQSYMJECYrnDewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFTOjQqI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFTOjQqI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2bf5e177ebdso692087a91.1
        for <loongarch@lists.linux.dev>; Fri, 24 May 2024 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716556671; x=1717161471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlXCQc3o/MB52ttkYbUWNblq+v3TZ5Rf15VGTVZLLpk=;
        b=EFTOjQqIoZJ0vt8+BFvVOMRgp8wLQgi6/A2XhJEqx9kLqELojTfuh4byvd/JruErPV
         /QvFW1yS6hqOXfxOJlsHC/0Me4HOOcf3Alv8Oi8hF1ZKtkY7kbikQA0xAP9NKksP2DTY
         mqEyKUlr3DAv55Vl41pYZ5wxC183BG+wdG5PM6tfIiHdaiKjXSZpxPrtHMTGE2SL7Qhv
         I2pkaDBimRtobBES4ZfTthUPBrrLlQw64iSi51pfJt9Oi9f5OfRHj1ekVqdWadrwgzgu
         r9EZFN/fiAHxsDkhSEHkCGp4DP7qoyoNsxa47YJRdRXg/lcEVvv3Mn5oWf8BZmgDOxBT
         aRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556671; x=1717161471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlXCQc3o/MB52ttkYbUWNblq+v3TZ5Rf15VGTVZLLpk=;
        b=aoQQtFM33+uYLL7ULc8wf4dmwAoMYrsDdnlX304p0eNHrdO+55Hzbr9QaUreEYCjQr
         ZvHJ42aBUfiId2kzhafjGkdm9wf+EbcbbUOKGA9sGSnBhNwQ81/WBfLQgiEb2PmbZiCB
         gUCJ/kuYvtbcfOCN0WGxSuUdfafvgKlI63nt5ATc1tYBMfkY8oe9E387ZOdOCTEvzzdY
         ktCS7C+58kULjP8olM4XB3nNcyZAm4/gVdBt5s4LMVR6DW2tlG8DnBWGUKH3sbTbeFoy
         UwAEWYHkSE0RJxz8y7iqRSKwY9m7f9/gds+EBHZ1IjS59/lhqE3pptjWIYpNKQt2c2NV
         Zeig==
X-Forwarded-Encrypted: i=1; AJvYcCUEqi9XXx2SSZdE64TtEWdiVGKn0cZspvyQeNHtCYZ0rekBKvGPH/9wSL/m3LyejUOiqsQ6mnxhvtUufeTAr3RD4xb96zavscL7
X-Gm-Message-State: AOJu0YxFPQ0lyolRzej62WKdCBFMK1r5NK0CeaYu5pTBzOg1EDus5uyu
	5U7Ms9vykeVOiPwCT+QX9V2aT3inQbK65qtKH1uasEddaIGHOE7WjVlJfQ1+Sn8r8ZaCeXf2ms6
	XVnZ2rPz0CQBLr36uORRYNlLLUmk=
X-Google-Smtp-Source: AGHT+IEwoe8jd0oZgn4cZUVcBCDA8tK4CYreDWY9kJHQp57IWOrilIahqDCBhTgwJSyB8G7rI/D9MAOMBfFiB7nWxpM=
X-Received: by 2002:a17:90b:1888:b0:2ac:5d2d:12ac with SMTP id
 98e67ed59e1d1-2bf5e84abfdmr2678646a91.5.1716556671509; Fri, 24 May 2024
 06:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
In-Reply-To: <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2024 09:17:40 -0400
Message-ID: <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Guenter Roeck <linux@roeck-us.net>
Cc: Samuel Holland <samuel.holland@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 5:16=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi,
>
> On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
> > Now that all previously-supported architectures select
> > ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instea=
d
> > of the existing list of architectures. It can also take advantage of th=
e
> > common kernel-mode FPU API and method of adjusting CFLAGS.
> >
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>
> With this patch in the mainline kernel, I get the following build error
> when trying to build powerpc:ppc32_allmodconfig.
>
> powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_=
mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm=
/amdgpu_dm_helpers.o uses soft float
> powerpc64-linux-ld: failed to merge target specific data of file drivers/=
gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>
> [ repeated many times ]
>
> The problem is no longer seen after reverting this patch.

Should be fixed with this patch:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/5f56be33f33dd1d50b9433f=
842c879a20dc00f5b
Will pull it into my -fixes branch.

Alex

>
> Guenter
