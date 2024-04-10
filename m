Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F171836C7
	for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 22:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712787704; cv=none; b=haUjuhf42Fo0lKKdX1XdWBfFga08Uv26TmJ2vVimgyJTT9Y3cdbaTy8PyFVOoFl2mV1572Zg6sQLxxEg92jI+LXtVj0YZEVW2s5/k/BJIZqnLprUE1CtNpDFNvng8W1nB5seLvmRrhP3mnnpeiCz0M+0rvSSs5juRKuOvgUxChA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712787704; c=relaxed/simple;
	bh=SQyfDI1p8mtUjtI3BfAFLemnAtOtjnfc4UlRkBuRrI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hETtSix4dWmrUlUDFZSKWAKFTY0FtGjCOGF7vTltuJAW+7//35bNstmBmo8kV8RuBhkcWI+krxBjAlNAjGhU5S17DidxxU+4Akgr+D4LtKMIDkCKHhaYF+huCyx3/L6pfH6Bn0jAxTCoYHO4Qf45EwTx8cZmHxOW5yAr3p2vAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdzi8z9G; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdzi8z9G"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e4149e7695so29262845ad.0
        for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 15:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712787702; x=1713392502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ9C1Cr3AvASEU86K/hlf2OO0iCRrNUVuyjVHdlWHE4=;
        b=jdzi8z9G1mj9DV3L8Vrcwj45HfaibSDaIjKuUBdla6kXkvd7LlVy7dNL8ZHpNJPrF8
         3dRm1zUMPpZo8gFeUKLTJD34P5ViiyAT5xvXYrNAwOqJZZfqCnJ9DHm1Lc4mognC3I1H
         DWcvpsLLxwKQsJvFI/korB5/f02PcT8zCpSu+VuMGUqVG91sKoQhrro6HGk7HeoixpM8
         VVQpXqr8ph09hDo4/fkjw4CG1tBW+3TczNpQHCrgez2/chbm93zurVGEzIKAtKU6FYLL
         OcK6hPvA/x7cVM0lfcbn5pIqZuPZNKyfmJp+DB/mK2uc5qZQ1zYcmslQi0hjZqFS0MNc
         vjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712787702; x=1713392502;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQ9C1Cr3AvASEU86K/hlf2OO0iCRrNUVuyjVHdlWHE4=;
        b=cwd0JY/zPke5vSejmKRtQmQxK7FH00dsnE4rQ7OMENhoYRItl80wX22W8lSjaJR3VL
         aXGj+tEzmcQVeX4xTl9hjYwuGBabgkB8l8Trkk75t9qwlC2lqG6IjTLwC5HsmaROgHpq
         ipqJOjzVJF/I4nhpBJI2siyAgLHc8HfslZJag8+rbiFWXm2zwWZOuvpqlVghf/UB5icy
         Lvl4eDXYBpmWG5eygqQjuQJ9pRjQ3UoyYDuVHWOrKlMOvdD6pIBJbYULsElXlNp/90G2
         O7srfDYt3wbG/X+d8XhYl+dq67R/ryXQwcMzc+IeelyTaVYW0wszIOfA/DohZHY462xn
         QFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZQzc+SrDZXDOTH2fmxoI9ktIqzR8Lwa3jinVDsHTHfdkmeOqIJaHHdCa1Prm+eOzpABTzB9xaXDcUubMcXRJcGrsZ9C3FXF7y
X-Gm-Message-State: AOJu0YzRGiIBljTbh1RDPRbWSAEhYYrg9P7T2vRc/5MdfQZlCDqJ7I61
	suFKFTLYYbZQXGsoKwKjA5K5qm1+TN5VTWx3dpzDr5gcj3Tz+xCOzqtHa7g9zMI=
X-Google-Smtp-Source: AGHT+IEyXjz5iWD+JzMbxman4f15iRJH7qvrzDvYbxC6J1pXkyjcclFUtxHEFXG2Dt+UzEnUxH7BCA==
X-Received: by 2002:a17:902:e810:b0:1e3:e081:e7f5 with SMTP id u16-20020a170902e81000b001e3e081e7f5mr5334384plg.66.1712787701595;
        Wed, 10 Apr 2024 15:21:41 -0700 (PDT)
Received: from localhost ([2804:214:8686:5e16:705e:67c9:b3ef:a558])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm39198plr.191.2024.04.10.15.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:21:41 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
  linux-arm-kernel@lists.infradead.org,  x86@kernel.org,
  linux-kernel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-riscv@lists.infradead.org,
  Christoph Hellwig <hch@lst.de>,  loongarch@lists.linux.dev,
  amd-gfx@lists.freedesktop.org,  Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <20240329072441.591471-14-samuel.holland@sifive.com> (Samuel
	Holland's message of "Fri, 29 Mar 2024 00:18:28 -0700")
References: <20240329072441.591471-1-samuel.holland@sifive.com>
	<20240329072441.591471-14-samuel.holland@sifive.com>
User-Agent: mu4e 1.12.2; emacs 29.3
Date: Wed, 10 Apr 2024 19:21:37 -0300
Message-ID: <87wmp4oo3y.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hello,

Samuel Holland <samuel.holland@sifive.com> writes:

> Now that all previously-supported architectures select
> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
> of the existing list of architectures. It can also take advantage of the
> common kernel-mode FPU API and method of adjusting CFLAGS.
>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Unfortunately this patch causes build failures on arm with allyesconfig
and allmodconfig. Tested with next-20240410.

Error with allyesconfig:

$ make -j 8 \
    O=3D$HOME/.cache/builds/linux-cross-arm \
    ARCH=3Darm \
    CROSS_COMPILE=3Darm-linux-gnueabihf-
make[1]: Entering directory '/home/bauermann/.cache/builds/linux-cross-arm'
    =E2=8B=AE
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.=
o: in function `dcn20_populate_dml_pipes_from_context':
dcn20_fpu.c:(.text+0x20f4): undefined reference to `__aeabi_l2d'
arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x210c): undefined reference to =
`__aeabi_l2d'
arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x2124): undefined reference to =
`__aeabi_l2d'
arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x213c): undefined reference to =
`__aeabi_l2d'
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.=
o: in function `pipe_ctx_to_e2e_pipe_params':
dcn_calcs.c:(.text+0x390): undefined reference to `__aeabi_l2d'
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.=
o:dcn_calcs.c:(.text+0x3a4): more undefined references to `__aeabi_l2d' fol=
low
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.o:=
 in function `optimize_configuration':
dml2_wrapper.c:(.text+0xcbc): undefined reference to `__aeabi_d2ulz'
arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_translatio=
n_helper.o: in function `populate_dml_plane_cfg_from_plane_state':
dml2_translation_helper.c:(.text+0x9e4): undefined reference to `__aeabi_l2=
d'
arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa20): undefined =
reference to `__aeabi_l2d'
arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa58): undefined =
reference to `__aeabi_l2d'
arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa90): undefined =
reference to `__aeabi_l2d'
make[3]: *** [/home/bauermann/src/linux/scripts/Makefile.vmlinux:37: vmlinu=
x] Error 1
make[2]: *** [/home/bauermann/src/linux/Makefile:1165: vmlinux] Error 2
make[1]: *** [/home/bauermann/src/linux/Makefile:240: __sub-make] Error 2
make[1]: Leaving directory '/home/bauermann/.cache/builds/linux-cross-arm'
make: *** [Makefile:240: __sub-make] Error 2

The error with allmodconfig is slightly different:

$ make -j 8 \
    O=3D$HOME/.cache/builds/linux-cross-arm \
    ARCH=3Darm \
    CROSS_COMPILE=3Darm-linux-gnueabihf-
make[1]: Entering directory '/home/bauermann/.cache/builds/linux-cross-arm'
    =E2=8B=AE
ERROR: modpost: "__aeabi_d2ulz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] unde=
fined!
ERROR: modpost: "__aeabi_l2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefi=
ned!
make[3]: *** [/home/bauermann/src/linux/scripts/Makefile.modpost:145: Modul=
e.symvers] Error 1
make[2]: *** [/home/bauermann/src/linux/Makefile:1876: modpost] Error 2
make[1]: *** [/home/bauermann/src/linux/Makefile:240: __sub-make] Error 2
make[1]: Leaving directory '/home/bauermann/.cache/builds/linux-cross-arm'
make: *** [Makefile:240: __sub-make] Error 2

--
Thiago
