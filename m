Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACD314F123
	for <loongarch@lists.linux.dev>; Fri,  9 Aug 2024 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723227686; cv=none; b=sFmjyuoDRO/sulCnMLNMDTb0NI2a02VMhhS47FYFq5Py2rvHi5rwI2sWhBZp7SrCv0wcb/gGv3ajyrRQQa52HVA8RHseAp8axA3Fj93OZ/eUQSVJxElVoCPzK7qUhD7vyrdEsrshbtynooL8gE1MY7cySOe3wDlWdy/zlzOW150=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723227686; c=relaxed/simple;
	bh=yrIcLQX/cGReHkkuFz6o+An8j150bAv3nUdA7o3gDL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaRH0r8hjxs40aHMNmv75ONHI0hulrzhNPl73NBXuniDC3U+iUJi7LdLRdt02thptNJx62rENZgqQSfHiF1iPn/HpMIdtUZlnnNoOZk57K7YkIeYCbXkoJcpMdII/PVksrjqQL9P6KRDIajqtrD/ZPKQ9fZ18kTWNsZvNkeaM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kTMzKeZv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kTMzKeZv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso1364575f8f.3
        for <loongarch@lists.linux.dev>; Fri, 09 Aug 2024 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723227683; x=1723832483; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5aSgr88/PRGVfxdX8pAdBy1fV+mFF55FgD+2QlLqzo=;
        b=kTMzKeZv/3HJBwbm6q25M/bgP/HXLU5K35C7cKfIPqw7YsWBTjb7kj5hF9c5r9e7h5
         ThRX6y04HQUZfMPcA0aY57TLPpzbZQr/wzV/yjnJrLwA3cuAJgcR/Rqbw1A0g3VSPnYR
         zylJ2Z+AAe5K0Ng/cECWI56ZX9B8J8rlUyxYGbeiIyDCzdT2QVuqzi+wN4Ui+Ucde5Wf
         KryTRVMcT8RwWAjqCXiGyKwASOd+DIGTXbqR9bp9y7H208RlBXSvCf7OB2+DtIGMNoTm
         +WlsYND+1wkebdvVafgDPA00BJMHyXPPg7wlsiqT70kWIAJPHf5sUjKXrRF9KwTNRI7o
         ciBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723227683; x=1723832483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5aSgr88/PRGVfxdX8pAdBy1fV+mFF55FgD+2QlLqzo=;
        b=QWiIYhr/RSVHLlkExmC+LmtQ1U/sEnXtVUvt+UKXCaESTc4ZazkJS5kjSqw9NdWMAa
         xT0IdUB6UBAsapqe0iwHr27fW/AP2ETjDRBnJ1ntPUSjTxGwjKCnJc052DoSanixPwsc
         ErLgJNQonP6zzTrgbraC7VXPm+OePFYX95yHBKId08eTapvNmxs1Fwlugnvt7hN5TtCd
         yKbgAkRjL5wVGLSqDOILfCO+kFM59Xl5XXwvbMEss6Mi8teDcFjcw6Zj07JBMv5Jpe/S
         rJXSr+vihGBuOqpbDa1VcCtLAB41vwSjWEfxqe2Rbwd1+Kf8Trp2eNOcB8/OqGzbZ5p7
         iAjg==
X-Forwarded-Encrypted: i=1; AJvYcCX64rEiKa0LCYq5jv4WcBF7cdmuSf+q3VPe42HON8+GoRtpG/X9abXx+yjTx2osTuKAbVqmrl6m+i9cfydGY55NKZPkmGMknH+s
X-Gm-Message-State: AOJu0YyoLEYM7Pl2v/zXy/s0JU7FplEL5bT4hBnoaBFJ0xI+QcN3YV7I
	/xxoZPnxfo3yl2fydZhsSnPIZzyN+PYGhtM5C3F05x+MCmWfUFqYc65R50whgowVzmBuPfKteqi
	NKkXaihXgDdeuTPZ9MF8sl0kL87XcouLD3dHH
X-Google-Smtp-Source: AGHT+IH5Ep/88bbCWZXRUVBPEQ+tzupqROr5HmyaRJfMyZWiEj8it63tIiOzqdgNyDMpwvhyZfPAAiV2XhcMqLgvZrs=
X-Received: by 2002:a5d:4642:0:b0:362:8201:fa3 with SMTP id
 ffacd0b85a97d-36d5ff6f35bmr1589390f8f.34.1723227683079; Fri, 09 Aug 2024
 11:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
 <20240808-tracepoint-v6-1-a23f800f1189@google.com> <20240809191601.3d15e3af.gary@garyguo.net>
In-Reply-To: <20240809191601.3d15e3af.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Aug 2024 20:21:10 +0200
Message-ID: <CAH5fLgi7dy9PV+YfCJuVoH98M0z2FUnOAjBoFKkqyG8P9iPSEQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] rust: add generic static_key_false
To: Gary Guo <gary@garyguo.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
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

On Fri, Aug 9, 2024 at 8:16=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu, 08 Aug 2024 17:23:37 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > Add just enough support for static key so that we can use it from
> > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > deprecated, so we add the same functionality to Rust.
> >
> > This patch only provides a generic implementation without code patching
> > (matching the one used when CONFIG_JUMP_LABEL is disabled). Later
> > patches add support for inline asm implementations that use runtime
> > patching.
> >
> > When CONFIG_JUMP_LABEL is unset, `static_key_count` is a static inline
> > function, so a Rust helper is defined for `static_key_count` in this
> > case. If Rust is compiled with LTO, this call should get inlined. The
> > helper can be eliminated once we have the necessary inline asm to make
> > atomic operations from Rust.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/bindings/bindings_helper.h       |  1 +
> >  rust/helpers.c                        |  9 +++++++++
> >  rust/kernel/arch_static_branch_asm.rs |  1 +
> >  rust/kernel/jump_label.rs             | 29 +++++++++++++++++++++++++++=
++
> >  rust/kernel/lib.rs                    |  1 +
> >  5 files changed, 41 insertions(+)
> >
> > diff --git a/rust/kernel/arch_static_branch_asm.rs b/rust/kernel/arch_s=
tatic_branch_asm.rs
> > new file mode 100644
> > index 000000000000..958f1f130455
> > --- /dev/null
> > +++ b/rust/kernel/arch_static_branch_asm.rs
> > @@ -0,0 +1 @@
> > +::kernel::concat_literals!("1: jmp " "{l_yes}" " # objtool NOPs this \=
n\t" ".pushsection __jump_table,  \"aw\" \n\t" " " ".balign 8" " " "\n\t" "=
.long 1b - . \n\t" ".long " "{l_yes}" "- . \n\t" " " ".quad" " " " " "{symb=
} + {off} + {branch}" " - . \n\t" ".popsection \n\t")
>
>
> I believe this file is included by mistake, given it's added to
> gitignore in patch 5.

We may have to rethink the file extension used here. You have no idea
how many times I've deleted that file from this commit.

Alice
