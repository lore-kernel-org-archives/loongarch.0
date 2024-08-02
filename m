Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6426B1DE852
	for <loongarch@lists.linux.dev>; Fri,  2 Aug 2024 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722597154; cv=none; b=VKTMD/ltsfs31UdFH8HZqtNY3grRRjCxB/xBEPs/KzuWNyyQ2/2bVOoNFOJwYU9/B3Ys1KMNeHUFaVmq+xz97CwNFkT8Omhl51XgR9QFK0b4n9aNMR3zvnvz0ut0enApLhKc6rEkE3d2clHe+Tk9GnfIixDd7kAVjdIsKKuieLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722597154; c=relaxed/simple;
	bh=gnO4O/zcd8S789cTMN1Qt5kvGy1SLpzswI2NiU04r2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4dRmc54FXQZHvlRxsNcjbnTODD5LWGn8aCKaQNsToDACpNgg9ncUp+sYfuBFrZiHVslAvQkKe3YpQGjfMnYLxOgcPoVSoJTdT5oSlsT8yi0HsFDy3EtPQEpXs0KWMGt7oldmXzNlUlSgww/AWCjr6DqASFzGoraF8ke12gLqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gxNY0GTb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gxNY0GTb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428141be2ddso53073545e9.2
        for <loongarch@lists.linux.dev>; Fri, 02 Aug 2024 04:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722597151; x=1723201951; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NckEZuTbgzBxmHzYz0RgKDaRsejCSb0E4WOQCnSKCEw=;
        b=gxNY0GTbFIfHdACaDCdm0aDjocdLOGSNS6nVM70XgylKKjyXRmeHmY8d+6jwiIouiX
         fcvEfo0Cg7MvAtizULx7LYXly2p08lUAsYU8hCBdTtU4QjmAGkGWV2qdH+XY9jXBpO9O
         /BVAdcwxBWGLG0uoJxp7FCtXYhz7NfM0DB6H+YtF/G6UXoxPwE2MaxsSbVi4PlOu6QAd
         Pb7KkWgH13gxKk38vzCOn+U2+YoKtuj7weI6wpjiUtgNbNMTPIbBZV1LsNULnWKLdLEX
         GSKNEsi4mD8OVd7aVN2/aqG2yJzqhKZt37ERcYucDRaW0UGSjmOJZRs/uFfXaqPRWHrM
         qoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597151; x=1723201951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NckEZuTbgzBxmHzYz0RgKDaRsejCSb0E4WOQCnSKCEw=;
        b=sV/DnMuSTtjCW3O8oRNOsaD8ELi9YkrVpE6jRy4Ujh4sxDV16/z8GGiOP17eHRQoJs
         llSyxo25CWvD67Z++fTudNgGavDGPr29uYeq2CYyPg8PJnkOSIyE1dese7FSfaJ8aIPK
         6eFOdnnudYOkpzP8zzEQK8S6aJCAB00aa4ilKVaFl3pWkTR9sLNh3bOuV10sl2aGZjE2
         Gk6IobUM8LcgBkos4kEWKRiS7+4CEIbUYvdgXF3xNKE+HIES9KRHtVRppHqwNZfGwAny
         EPVlMSG7sBH19dxxNFIu3XstoVWbWaoWT674b23DN8KFCuXqnQf//c30fiwuuo7ScRxo
         O6kA==
X-Forwarded-Encrypted: i=1; AJvYcCWRlzaz7ulPIeYuint78ljB11g93t3HbcWJfq5zZGJYhxtOxVXLh/qn/OOCuQPffjVd9RT4viuSZCNsUGFC5kTA9wsiQZiaMewl
X-Gm-Message-State: AOJu0YwZaV7OJn1FipZPO7SE4Cbuu8f7YWCacXKWPmF9BuKu1brdTEQD
	ChDDVBxHq9IyaKccc/Byso0TBAYLiZzAYiabeg+/35eibq5XRZ3cndzDX3+0VTvmAbspjOT1NE+
	z24tpusI6DKEyc9MgtMs8LOoM6m9d+mvDFkjr
X-Google-Smtp-Source: AGHT+IHG8YT0Tl3r67jSeYzzG/u+IjzVWq2bWRMReS90gVbkEE3+W7//BJg0NubXE694omwJobmhmLbd7NfxN4kakP4=
X-Received: by 2002:a5d:4003:0:b0:368:4edc:611e with SMTP id
 ffacd0b85a97d-36bbc0db7c9mr1721957f8f.14.1722597150322; Fri, 02 Aug 2024
 04:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
 <20240802-tracepoint-v5-1-faa164494dcb@google.com> <20240802093954.GH39708@noisy.programming.kicks-ass.net>
In-Reply-To: <20240802093954.GH39708@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 Aug 2024 13:12:17 +0200
Message-ID: <CAH5fLggBRBOrGb_2RLP=tFyGeiMmkH+86F-d0Pidv5z-shZ8Vg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add static_key_false
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	WANG Rui <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 11:40=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Aug 02, 2024 at 09:31:27AM +0000, Alice Ryhl wrote:
> > Add just enough support for static key so that we can use it from
> > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > deprecated, so we add the same functionality to Rust.
> >
> > It is not possible to use the existing C implementation of
> > arch_static_branch because it passes the argument `key` to inline
> > assembly as an 'i' parameter, so any attempt to add a C helper for this
> > function will fail to compile because the value of `key` must be known
> > at compile-time.
> >
> > One disadvantage of this patch is that it introduces a fair amount of
> > duplicated inline assembly. However, this is a limited and temporary
> > situation:
> >
> > 1. Most inline assembly has no reason to be duplicated like this. It is
> >    only needed here due to the use of 'i' parameters.
> >
> > 2. Alice will submit a patch along the lines of [1] that removes the
> >    duplication. This will happen as a follow-up to this patch series.
>
> You're talking about yourself in the 3rd person?

I'm not sure if commit messages are supposed to be a personal message
from me, or an impersonal description of the patch. I'm happy to
reword.

> What's the rush, why not do it right first?

Well for one, this version of the series mostly just makes changes to
the second patch.

But also, maybe I'm being too aggressive about it, but I have large
amounts of out-of-tree code that I've been working on upstreaming, and
it's a lot of work to keep it all up-to-date and rebased. I want to
reduce it as much as I can. I was hoping that I could get the changes
to include/linux/tracepoint.h off my plate, even if more work is
needed on the static_key side of things.

Alice
