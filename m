Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D122264A6
	for <loongarch@lists.linux.dev>; Fri, 15 Aug 2025 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270456; cv=none; b=ahtD2btUnNpuCJLbeHDstP+9xwh83TqP7IyrbcsPNix2sunUmzwTU48w2KLkNHpEwZLZvsk6QGL6Kct4vqz3dNOtljmRG4fnR80dy0KA2hhg2NqQ98RzUNqdT/RtlGSzxHqDB19s6nIDiT6D+TtRK7yUs2XZpOvOvBjKf0xjwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270456; c=relaxed/simple;
	bh=k91CyiH72FbwUJJuYjdfRL6Li8iR2YI2J5hUcfGbFcw=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=dt5ifcwAVk+ndol7dem/Nq0DCt2ygE62ipxhAz3W+n0A1Xa5MBP/0hVP2UJWsd3cIR8loQTIEzz9q+zkd/Ly6yiPxViz4slEKFjqSRTnXXxEbGWMwusLALwcYFoL4ohtYtVuVI+cNnNq9ZSwHyK4zGEoBBqxyw8QIUSXdeAsSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=OaFO4y3I; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="OaFO4y3I"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso1253681b3a.3
        for <loongarch@lists.linux.dev>; Fri, 15 Aug 2025 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270454; x=1755875254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=OaFO4y3ICidVUFl54ORZA6EfuTkjTUZoKsypyBkOc2H6FQPpMfMqvimxm12CcmeLNe
         CknfocQcGAcu21vLD7b96IRomYjxObsQQgxxmA+TXzNCEG8rGpbx1+uaK6y0kNvaUFoW
         7mHT4LyNy/q2RFidlCxCuFuiy15V/rrRkDkyqvXSIFL+qAS8T0eg26rMPrw5OMoXXhnC
         BLqxycTWWwKdk81lpbvHOjj5fDWirZElUX9hgd3bKqZqxqkpkDlQDjDqgVugeIwU885H
         OY9Wnpm6bBN0XGOg6oiL4pOhxCL9lY6pIcqd0p4+4AtA7IQ/7PthhvuXWofRv+Rj3zei
         /DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270454; x=1755875254;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=BtQkqyBhg0K+OchI7Lj+aSBhXFYx7/HEjAKHI1BtfCxKdia+wN9C/8/ngp5uoxh1Je
         2ktiVcNekxEh2zcCDaJ7wI+XBVs4Pw0Fvh780KoWM9ULhdikmROEBxihc+54ZP1h/sFX
         gkT5BxnB8w897FleJBlnph/+9vditl1/247kkQ71zJb+bU3FQHRwGg/5JiCMNreLtpqu
         bDykZ3Cpl9tCjeSpn/sY41oxobwbmZBMQaw75ZQlR2RJv5FRNssd5Z5eoBFyEczQqshz
         YEaHfeXTDyx9uVqF0AtmDojLnZHV/cA7XxM0mLLQpqKw3z7cBLwZWTp0eeiCKI1kCzty
         W7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAjUmTw/3ybXAOhADRfngdXWYqJ5n9BpiDyB0fgxMlZUFgJ3P42okdOoC1EGhGr9OJa5qHRhSd3N8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzBW8fzrT+QG+SB5XNVg0Yp7ofGPS+LpWQN05fqMwFnfJqCKxE
	j8en+d8YMYDtUkWI3XeKad8unBv68cg50/Ctzg4Oq/jRjdHb4tKBygrOSB9ivpbtBGM=
X-Gm-Gg: ASbGncu3x3TTg526ffK5MM9xyhmhoEiCTwGITcCo8mDKJ2Puc9XSoHOTBUY9WkClu8b
	wetT7tveK6HEognhxdPBcowIfX19rRLohKNYDJzI+3f9MnOSI68WtwSxSudw9BWBagL+naGj8F9
	hYYKb4r8po8Q9/nwWJcnrl94tWNEoquplneMYWCyN2Ksap2Mk9gGwavFs7Ubzapxxqt4z9oS9tD
	zzoPC/7w92HVAJK7c4ALwsbih0itLrvveoE9VtGqMqrJc8cZ786fkiRceIn3RVjqjG7GpWO1leQ
	AilGZtIiClPZy6vZCIU+wBSb+3kEDujyBRXQ8rsnn8gjxMTtmV2Celx3bLZ3uHNr1cOysnLav7x
	C/2Tj/Iqooa70znHsXVui6oGfwS4yfzERe+I=
X-Google-Smtp-Source: AGHT+IGQbGMaqUCBVjgHpE03NJ6lUtJGuN0cfMPLFV18k27l43zYHixLrnt22lRnZXhrjts5z9io5w==
X-Received: by 2002:a05:6a20:1611:b0:23f:f5bf:35d7 with SMTP id adf61e73a8af0-240d3039205mr3462386637.45.1755270453673;
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b472d5e58d0sm1499710a12.23.2025.08.15.08.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:07:29 PDT (-0700)
Subject:     Re: [PATCH v4 18/24] riscv: vdso: Disable LTO for the vDSO
In-Reply-To: <20250812-vdso-absolute-reloc-v4-18-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-146EE95D-951E-41BB-898C-033437B27EA3@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 11 Aug 2025 22:44:31 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> All the other architectures supporting LTO (x86, arm64, loongarch) do not
> use it for the vDSO.
>
> Its is problematic for some upcoming compile-time validation of the
> generated object code.
> The LTO object files do not contain the necessary relocation information
> and -flto-fat-objects is not compatible with clang < 16.
>
> For consistency and to enable the mentioned compile-time checks,
> disable LTO for the vDSO.
> The vDSO heavily uses __always_inline anyways.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index c19c3c76f7c9f6b2f7523a59269de3b683656323..9f1bf5bae9bd473e43d9fd3022e9e1a185128b73 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,7 +49,7 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
>  endif
>
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_LTO)
>  CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Also assuming this goes with the others.  Thanks!
