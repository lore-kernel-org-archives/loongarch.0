Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F25322738A
	for <loongarch@lists.linux.dev>; Thu, 17 Oct 2024 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729193539; cv=none; b=pnTuaBJOZPzwHNJPFvoprsM6GVEVx/PtiYsvReVhsQGnsNoccDmTFoFNXBpc5SnPQdxT6LyD0NclM2XTcUGunWeJSd30r4i7WDnaofwUBtLuP/YBBsDj/2ZJ3ByDGAxoqSoLXnCeMIlqJ39TtL4Mct9Mv9Y1Y+1YAPYv3DKyB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729193539; c=relaxed/simple;
	bh=vcUXd5tt9utnmCVe/nP6iWVCPF6al6ngb6a3ypPbz8U=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=EkSTrxF5koE9gPkP8EQpCq16vRZ868laPMKwhgETj5/4GxXxsuj9z/XoMl9VsPv3fO2dhL1Z0ILNPtZlpu8m+5ixm2GCzT6SQT9gGVf/Pql2vGgiBgrTNAg9xrhZqT3+WgS0JIpRGHL7mzVq5VMr/qOx+QfMRCkG8gk7HMo0Ero=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=13DL5/IV; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="13DL5/IV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e579abb99so932009b3a.2
        for <loongarch@lists.linux.dev>; Thu, 17 Oct 2024 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729193535; x=1729798335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfCj0XZYQNwVFG9YcnvaiklTwIyQ/GhWVOU/ROFZAio=;
        b=13DL5/IVcdKiwK3SMjdrH45M4ZanjiadF/+UlqxfErARTd4usAsuEdyt1wSrk/2wc/
         sITmrwVReX9tll3UbIgb20u5ersBLwmZogaaNIz+CKVGbUQQ6P8IDDLgO1tpxciAYx6f
         eTZiW51IxijbpeLvH/Vudu5QaHn/Ue1x4Td3Z++xRCYlwLJTKmiTK59pcBirU4cPixr5
         Y9NVl3Zi/eLUsJdl8YgVezBkSUyP7f+1IgwYxUFsTUIONY8A0cKTKJeeY9NkMnlQdHTr
         EZG8L6RBm1UyLXJyg9bv1uEv0l0ZSmODoByyGL7a+buDNjdNz2CRKoGY91rQh1dE3IYZ
         Kvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729193535; x=1729798335;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfCj0XZYQNwVFG9YcnvaiklTwIyQ/GhWVOU/ROFZAio=;
        b=vhOuLLGn/kSNf89LvJ3FESw/mqnwMCPXUmiySkMueUlP2HMqWSxefxY+rjC7eLede1
         oA/5nUjhEDsHHeUQkLSa5jSjZ+0GR+sKmLul8F7UtD3swuGW/vG/mMm1O3UU3REBekKh
         RjfSVCBK7EaM/TlGQLViliELv6EfZ/zDfChpishrxsVU2UN61xa2v/+Qht1PLBOwLb9r
         BO+F7EiisSaF1z5S4bRR4Zoy1Z8RTSh//LEbHSXmRdrRLLmXuZo6T54UPncm+UI5Xpwi
         GgYn9loW7732Yq8ZUp7QY4i3Jg8LF1Y96bgkGKwL7ZBJbrqNKjUjJfBtTXF6UTm/t11f
         GpXA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6FXuna2E7zIR2OxXSTqx03BZp/ynAL0AOjska7/AGBzt3LvhkyNG5cci7L9u6hzHDvwuYnB6d+k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy17LgJENFPKm/Rw313VszizOLyJuQcKiSPDQwu6XKxK/69lNqM
	QR8M384fvp7LJmac0qNCupiqlFfcRHfs4bPdSRYaEOha+X1VeATWxqYBbV07KzY=
X-Google-Smtp-Source: AGHT+IEYQqSWyT9DM1JblvCRXie6c7wEQ7WCCMd8WOwGbnCY29CemQ9nchGTw3++94PPWZqamrgDPA==
X-Received: by 2002:a05:6a00:2d25:b0:71e:5950:97d2 with SMTP id d2e1a72fcca58-71ea3328e08mr68611b3a.17.1729193534443;
        Thu, 17 Oct 2024 12:32:14 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea34a7fa8sm9965b3a.184.2024.10.17.12.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:32:13 -0700 (PDT)
Date: Thu, 17 Oct 2024 12:32:13 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Oct 2024 12:32:02 PDT (-0700)
Subject:     Re: [PATCH v11 4/5] jump_label: adjust inline asm to be consistent
In-Reply-To: <20241015-tracepoint-v11-4-cceb65820089@google.com>
CC: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
  peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, Ard Biesheuvel <ardb@kernel.org>,
  ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
  gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
  linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
  Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, ubizjak@gmail.com,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
  oliver.upton@linux.dev, Mark Rutland <mark.rutland@arm.com>, ryan.roberts@arm.com, tabba@google.com,
  linux-arm-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  apatel@ventanamicro.com, ajones@ventanamicro.com, alexghiti@rivosinc.com,
  Conor Dooley <conor.dooley@microchip.com>, samuel.holland@sifive.com, linux-riscv@lists.infradead.org,
  chenhuacai@kernel.org, kernel@xen0n.name, maobibo@loongson.cn, yangtiezhu@loongson.cn,
  akpm@linux-foundation.org, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, aliceryhl@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: aliceryhl@google.com
Message-ID: <mhng-0614da52-c420-4be1-a5b9-64dacae91d0e@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 15 Oct 2024 06:14:58 PDT (-0700), aliceryhl@google.com wrote:
> To avoid duplication of inline asm between C and Rust, we need to
> import the inline asm from the relevant `jump_label.h` header into Rust.
> To make that easier, this patch updates the header files to expose the
> inline asm via a new ARCH_STATIC_BRANCH_ASM macro.
>
> The header files are all updated to define a ARCH_STATIC_BRANCH_ASM that
> takes the same arguments in a consistent order so that Rust can use the
> same logic for every architecture.
>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  arch/arm/include/asm/jump_label.h       | 14 +++++----
>  arch/arm64/include/asm/jump_label.h     | 20 ++++++++-----
>  arch/loongarch/include/asm/jump_label.h | 16 +++++++----
>  arch/riscv/include/asm/jump_label.h     | 50 ++++++++++++++++++---------------
>  arch/x86/include/asm/jump_label.h       | 35 +++++++++--------------
>  5 files changed, 73 insertions(+), 62 deletions(-)

[...]

> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 1c768d02bd0c..87a71cc6d146 100644
> --- a/arch/riscv/include/asm/jump_label.h
> +++ b/arch/riscv/include/asm/jump_label.h
> @@ -16,21 +16,28 @@
>
>  #define JUMP_LABEL_NOP_SIZE 4
>
> +#define JUMP_TABLE_ENTRY(key, label)			\
> +	".pushsection	__jump_table, \"aw\"	\n\t"	\
> +	".align		" RISCV_LGPTR "		\n\t"	\
> +	".long		1b - ., " label " - .	\n\t"	\
> +	"" RISCV_PTR "	" key " - .		\n\t"	\
> +	".popsection				\n\t"
> +
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"	.align		2		\n\t"	\
> +	"	.option push			\n\t"	\
> +	"	.option norelax			\n\t"	\
> +	"	.option norvc			\n\t"	\
> +	"1:	nop				\n\t"	\
> +	"	.option pop			\n\t"	\
> +	JUMP_TABLE_ENTRY(key, label)
> +
>  static __always_inline bool arch_static_branch(struct static_key * const key,
>  					       const bool branch)
>  {
>  	asm goto(
> -		"	.align		2			\n\t"
> -		"	.option push				\n\t"
> -		"	.option norelax				\n\t"
> -		"	.option norvc				\n\t"
> -		"1:	nop					\n\t"
> -		"	.option pop				\n\t"
> -		"	.pushsection	__jump_table, \"aw\"	\n\t"
> -		"	.align		" RISCV_LGPTR "		\n\t"
> -		"	.long		1b - ., %l[label] - .	\n\t"
> -		"	" RISCV_PTR "	%0 - .			\n\t"
> -		"	.popsection				\n\t"
> +		ARCH_STATIC_BRANCH_ASM("%0", "%l[label]")
>  		:  :  "i"(&((char *)key)[branch]) :  : label);
>
>  	return false;
> @@ -38,21 +45,20 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
>  	return true;
>  }
>
> +#define ARCH_STATIC_BRANCH_JUMP_ASM(key, label)		\
> +	"	.align		2		\n\t"	\
> +	"	.option push			\n\t"	\
> +	"	.option norelax			\n\t"	\
> +	"	.option norvc			\n\t"	\
> +	"1:	j	" label "		\n\t" \
> +	"	.option pop			\n\t"	\
> +	JUMP_TABLE_ENTRY(key, label)
> +
>  static __always_inline bool arch_static_branch_jump(struct static_key * const key,
>  						    const bool branch)
>  {
>  	asm goto(
> -		"	.align		2			\n\t"
> -		"	.option push				\n\t"
> -		"	.option norelax				\n\t"
> -		"	.option norvc				\n\t"
> -		"1:	j		%l[label]		\n\t"
> -		"	.option pop				\n\t"
> -		"	.pushsection	__jump_table, \"aw\"	\n\t"
> -		"	.align		" RISCV_LGPTR "		\n\t"
> -		"	.long		1b - ., %l[label] - .	\n\t"
> -		"	" RISCV_PTR "	%0 - .			\n\t"
> -		"	.popsection				\n\t"
> +		ARCH_STATIC_BRANCH_JUMP_ASM("%0", "%l[label]")
>  		:  :  "i"(&((char *)key)[branch]) :  : label);
>
>  	return false;

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
