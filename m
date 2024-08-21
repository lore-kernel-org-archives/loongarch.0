Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6056D4085D
	for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724264203; cv=none; b=gIfDUVr0gvnJWSq1KyQrXHnPzVS9yEXh87b0BD9ZB3fXvB9tttq4qpScXo3EGnPFaE701Veb3wSVoxmn9W+4umJ8tlGF4WBNf7/jikfOkaL97jrT6soTLhKSh2muC4RvNni8AhwLpPVZG/UW4bvwPuPvI6LxzCv8uTInbBXzerA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724264203; c=relaxed/simple;
	bh=JnxeSLPQhSwfoYfEPIBCpVy3r4CFvAx9fVu3+4VZyrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dfk+5SQ4GRgMGdUB0u5+rV93CTJ/hVqlsm5+ajd68cpQW0ejN9M3rlFnOoCjRpT5babxVL0ob2j6CxrQroFpUFu2qV1QKbgXoa6LaGyzY0zkVchAZiBWSUoPr3pAL3TzAzarTgN6HfwJcP7BUMyMCR/TlFLO2R/ysm+jZDlgwDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt5UzGcY; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt5UzGcY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44ff7bdb5a6so120281cf.3
        for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724264201; x=1724869001; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sG1wp5ENtjpkC5FIqQpPJO0RYHtQ0kKqwcDpDZ1g0uo=;
        b=Gt5UzGcYBMnSidNVDgDBoYZaFqX5TxLaSkUkQJkzozsWCIOU6cMNv1giQ5sz1U0jtm
         p7hrsxD8joW+spSvA/i+DPvPEpkUW8L4XsAX4s772V32tBe0LiTztpPhS2jrK3d3AHG+
         75WhJn68Mhfz0IDCaSuCVewdYKjsDa4HEQKcL4vBYCS/66oTMN3hmgM0/gBbFRmDOJFd
         I+c0Mx41BJ6CNwMR4o26p1C4EvKwc3ZCtWsV5TUU4CYjuwfd4fDUv+kvrKKdA1tc+lxy
         Eg8qt12D6qftXBns/jZ3IrHwRd9cu2fSE6tK15OptCczcepyRnPRiy5S6uG+JPFCxYtq
         cyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724264201; x=1724869001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG1wp5ENtjpkC5FIqQpPJO0RYHtQ0kKqwcDpDZ1g0uo=;
        b=H6ysqsFcybi3fZM1jRrexZ4yji5zWXdcNfOV3AnkV/830PPWc1wRl7OL76tmHoENEk
         F47w4GWoBFjCfE00hHGXo2jX7KFZvngosNDQqD85Ko+oCnf9d6Vr/OP/dWoUKrjz8A6t
         N48j2wlmLStJCSLGby9025ZgZgJv9r0QNmNll3YzJVyUJ/j+HF8IhmKdOu1SVaymC8lh
         ewQxqPyAx8uD+uICpzqI38Kw7tis7YLrk3PsSWqqWzZzqSn+2SwTup/vGjjxjMryUHfc
         QrSYJxXdIK6JGUeDxQnSubFA5eLhVqgnPCRz4Il1R+srwrO36mXR2M/P32YbBBQ+zXLe
         wCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp4qGADWtUmahEfNnaXCXRoNy4rehLx5Tp96mXmxJq6ONpjW2UNxGf9a6PnTMrIcItn5ychF4i5f4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqLT8beofOf4epZPDmVdB2bEaGjYNXQIeXMsAvHcN9JObhBqKF
	zv9at9/TNJsFJ6WBc4wWOXHW5+SchuEDBAH7QbzECe/81WXBKnO0
X-Google-Smtp-Source: AGHT+IEmIudWwUZSOHrAG/eup+YcE8K3ibS5ReEgFCUmkDy3yMOQddDLaWBfo/D6lfVEz1iolaNsRQ==
X-Received: by 2002:a05:622a:4c87:b0:447:e542:ab00 with SMTP id d75a77b69052e-454f2572a5bmr39175031cf.50.1724264201152;
        Wed, 21 Aug 2024 11:16:41 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369ff5348sm61597621cf.32.2024.08.21.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 11:16:41 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id D2D001200068;
	Wed, 21 Aug 2024 14:16:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 21 Aug 2024 14:16:38 -0400
X-ME-Sender: <xms:Bi_GZjkYOU0_uPVPB7K8kPU5t6uwe1a7iRrD-8l2b4FwhEEHvPWNqA>
    <xme:Bi_GZm2ilDewDM48ADFZyAyLkN8ETYp8o2kgHXVk2M3oH1XV2KSY8l8XSHpaXSdPi
    vUWJDJ9vpJCTKTtBQ>
X-ME-Received: <xmr:Bi_GZppuE27zSpGhNm_MKiRYFzIueXaa6Olt3HDwdTYkHLAy97t7mvl_E4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddukedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledt
    hffgheegkeekiefgudekhffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnh
    guohhnihhssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghho
    ohhglhgvrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrgh
    dprhgtphhtthhopehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    mhgrthhhihgvuhdruggvshhnohihvghrshesvghffhhitghiohhsrdgtohhmpdhrtghpth
    htohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhpohhi
    mhgsohgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrg
    hirdgtohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Bi_GZrnffxrLWDEUyOfAuK4X7MxRHl41DuNXEXwU9qN7EOxG4IC8rw>
    <xmx:Bi_GZh08QhTMZZDvPplmdtt8yUAyIg0RVUC7Hs34ECG-0ApoLpa8Lw>
    <xmx:Bi_GZqtC2DOqemnStVjIsc28f6yLb0riAR4qzKHtDsMZ3qIXiCyfOg>
    <xmx:Bi_GZlWWO5FFsKpoIG5v09YA8ZfPbtyqcLKXJfL7WsrB9b0kzX0aXg>
    <xmx:Bi_GZg0tfLSerjrQuTHq9tMZrxOF1nPbYUVoJWR9XLUkCH6bFCPKKA61>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Aug 2024 14:16:38 -0400 (EDT)
Date: Wed, 21 Aug 2024 11:16:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,	Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>,	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,	Ryan Roberts <ryan.roberts@arm.com>,
 Fuad Tabba <tabba@google.com>,	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v7 5/5] rust: add arch_static_branch
Message-ID: <ZsYvAJbGB8qUcjXA@boqun-archlinux>
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
 <20240816-tracepoint-v7-5-d609b916b819@google.com>
 <ZsYfAFrBFVewchGM@boqun-archlinux>
 <CANiq72np8GhZ4V22b7RekvQOhCbM67A-19Px2aVLgweC4Qxebg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72np8GhZ4V22b7RekvQOhCbM67A-19Px2aVLgweC4Qxebg@mail.gmail.com>

On Wed, Aug 21, 2024 at 07:54:51PM +0200, Miguel Ojeda wrote:
> On Wed, Aug 21, 2024 at 7:08 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Have you try this with "make O=<dir>"? I hit the following issue, but I
> > am rebasing on rust-dev, so I might miss something:
> >
> >         error: couldn't read ../rust/kernel/arch_static_branch_asm.rs: No such file or directory (os error 2)
> >           --> ../rust/kernel/jump_label.rs:39:17
> >            |
> >         39 | const _: &str = include!("arch_static_branch_asm.rs");
> >            |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >            |
> >            = note: this error originates in the macro `include` (in Nightly builds, run with -Z macro-backtrace for more info)
> >
> >         error: aborting due to 1 previous error
> 
> Yeah, we should use a `*TREE` everywhere. In addition, we should not
> use `SRCTREE` but `OBJTREE`. It is my fault, this comes from my
> prototype I gave Alice.
> 
> Please see the attached diff.
> 

Yes, this fix works, thanks!

Regards,
Boqun

> Cheers,
> Miguel

> diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
> index 7757e4f8e85e..ccfd20589c21 100644
> --- a/rust/kernel/jump_label.rs
> +++ b/rust/kernel/jump_label.rs
> @@ -36,7 +36,7 @@ macro_rules! static_key_false {
> 
>  /// Assert that the assembly block evaluates to a string literal.
>  #[cfg(CONFIG_JUMP_LABEL)]
> -const _: &str = include!("arch_static_branch_asm.rs");
> +const _: &str = include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
> 
>  #[macro_export]
>  #[doc(hidden)]
> @@ -45,7 +45,7 @@ macro_rules! static_key_false {
>  macro_rules! arch_static_branch {
>      ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
>          $crate::asm!(
> -            include!(concat!(env!("SRCTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
> +            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
>              l_yes = label {
>                  break 'my_label true;
>              },
> @@ -65,7 +65,7 @@ macro_rules! arch_static_branch {
>  macro_rules! arch_static_branch {
>      ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
>          $crate::asm!(
> -            include!(concat!(env!("SRCTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
> +            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
>              l_yes = label {
>                  break 'my_label true;
>              },
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 4f0f6b13ebd7..746cce80545f 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -269,7 +269,7 @@ rust_allowed_features := asm_const,asm_goto,new_uninit
>  # current working directory, which may be not accessible in the out-of-tree
>  # modules case.
>  rust_common_cmd = \
> -	SRCTREE=$(abspath $(srctree)) \
> +	OBJTREE=$(abspath $(objtree)) \
>  	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
>  	-Zallow-features=$(rust_allowed_features) \
>  	-Zcrate-attr=no_std \

