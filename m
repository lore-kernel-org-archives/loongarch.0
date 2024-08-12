Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DBC17B43F
	for <loongarch@lists.linux.dev>; Mon, 12 Aug 2024 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469594; cv=none; b=Z3DcVof8AYVlinliSXIb5dhhA7Vr/wKLOPGqZOH18shXhxSvDSQivqy+UT7IDtcqRoScTU9gPE91wb9JLIb9YXXethS5eJUhsTBj1hnyj1fjLZE/gBAuuIid0fhK1JvyuWADyRAbNqUyCS1+opRLpaGx2qHPt/G4nGghRgtUGKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469594; c=relaxed/simple;
	bh=yQGH4wTqdj6UgcbMWJ/OlXYfokf0rrWK3E7OaiXkuCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqVI0mnQdygBB807dlA8iHiNMiPphDBztbTJh5RGvXfcWF5S1jocjr+zJdh4GneUpObLb1GJSL6i/xoyecGY+9BJcZdDkuy1Dpl9cdJU61yMPPsw6SXGArx05FgoWmYCrYWj3WBDeFkInjZGE2GHIhKlrNO4v0dXf9iB01GmOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xk2n0jLs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xk2n0jLs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42816ca782dso33280995e9.2
        for <loongarch@lists.linux.dev>; Mon, 12 Aug 2024 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723469592; x=1724074392; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQGH4wTqdj6UgcbMWJ/OlXYfokf0rrWK3E7OaiXkuCI=;
        b=xk2n0jLsEVgOFgCTgcuG8u6SbeNiNid0GXk010WEORn7EB1eVOmLx8YoeT+10ovmC6
         m5kGdsJslwiRVr8odooKCpV+Vf9IkBITYtxCKX8DGJEE4L5QCFCUo00R9ZGdzbF8qJ+5
         VnjHdN98zeP+PIrBvklVi5NvJk7xqr2l6dIwmYjFUf4TbMAmt81xmvWlb2+pSSbpET5r
         wi2ivm+noHLTycvsqOMuwighbiPWU4sHtVx48T3dYO+EBRgoxei7emgoT7u3uQFNOwgs
         8XwlIS1uT+z4IYoRzmvPW041jQRN7H+HV0faOIj+VCgNpaxO4t966EzZ+lpPfrg+tTke
         +HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469592; x=1724074392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQGH4wTqdj6UgcbMWJ/OlXYfokf0rrWK3E7OaiXkuCI=;
        b=qppFp6Fj54lTmMWndksWbiP0AFY7PFtsVKmNhizLZdAPtQdKNhLTNqUT5rlnrAuK4W
         LWFxRLrYbidI2sqf6jO+h5xlbGOFqsr6Q+Jj3ANwIZ5qxBDxjYOGhHEOrNyx231XHKAg
         9sIYS/1hsPRafme+3x82UGR3mKsrhHnr3G/VkpgTGj1LwFR0a6cb/QByHt+/zALyk2Uv
         xTm8wOhhnQxljvt3zVhQ4HYsjBVDCIoQ1r6BUICe+Ap+2oUtrLSBv0WC9kAvS+rysCQz
         3Zt96hYYqr3E8deufLv8NEmPwmYi+LGFPSCnAcKolHguTjFmP5dM+im8jBH3j3b/PJfB
         bykg==
X-Forwarded-Encrypted: i=1; AJvYcCXL3k4BNyLi2LqtkmzPjnp4YRMmb4O2tK1O2J3wLSMP4v/ejDCvK3/rcLJrKKDzk/vFFMEsPfWsqRGj2dMLFPpFoy9ybJWy7zhe
X-Gm-Message-State: AOJu0YzRBV/XttNBUOHOjJDAhNFY1R4JpE189yZngwaU915Mg4ZQ7NWZ
	sWfnLNYsNV3ZxrGy+FBxHWM0EU3zuZICpjmYdDT/nfQrs/ToVtA7S2YwWq52nrcbZL+RI8MS30P
	//ETT0kotLKbwggsN+IBWvmLYYOzAdqdUSKhL
X-Google-Smtp-Source: AGHT+IHW60xClnCiQEYYTC8Z9PZ33xaYy4WZgALT6Q+LMP95jazFgPNu9OZ8W3SxyYi1G4TpTJOyz0WQCdXu9YQVFvk=
X-Received: by 2002:a05:6000:b42:b0:363:d980:9a9e with SMTP id
 ffacd0b85a97d-3716cd267abmr226021f8f.55.1723469591316; Mon, 12 Aug 2024
 06:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com> <20240808-tracepoint-v6-4-a23f800f1189@google.com>
In-Reply-To: <20240808-tracepoint-v6-4-a23f800f1189@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 12 Aug 2024 15:32:59 +0200
Message-ID: <CAH5fLggC_73YQGLLjUsGnsUjAr9vOS-ebG0=-dWGqS7euzzf4Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] jump_label: adjust inline asm to be consistent
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 7:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> To avoid duplication of inline asm between C and Rust, we need to
> import the inline asm from the relevant `jump_label.h` header into Rust.
> To make that easier, this patch updates the header files to expose the
> inline asm via a new ARCH_STATIC_BRANCH_ASM macro.
>
> The header files are all updated to define a ARCH_STATIC_BRANCH_ASM that
> takes the same arguments in a consistent order so that Rust can use the
> same logic for every architecture.
>
> Link: https://lore.kernel.org/r/20240725183325.122827-7-ojeda@kernel.org =
[1]

This link is in the wrong place. It's supposed to be mentioned as a
dependency for this series. Also, I intended to have the same tags
here as I did on the last patch.

Alice
