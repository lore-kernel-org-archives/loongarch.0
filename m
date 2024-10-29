Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50612197A77
	for <loongarch@lists.linux.dev>; Tue, 29 Oct 2024 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730224246; cv=none; b=dnkqxA8kk8/MAOv514ZepS8oy3RNrEavjw4yZk2SFAP30Ym/LUMPnRQQRBj7mAsx6JXRoJNWI+bmFJK4RPbK5Kv5GuZuy/ylc+BdEL8yiH21dWdMkKfnxXgu+0uDX84Tx4i7OS6pug185lQTLlaPtVy4xWHLvaSW0Zk5CYpHt9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730224246; c=relaxed/simple;
	bh=3Ya/vna/josXfaP08+rZliV3Vbn6Ymxerk6FxliU00o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvdoZS2wdKAKs7lv4PR94loXWK9p/5SbPAXCIhbTOOib1SfKmTl6MyQ4tRbJkoUwhqG1wUzzHIoNFOY0RKcIt2OnFdbCStwEv8Jb6hd5GRPiSh1NZPibJE+SBurMoHageQbzy+YIXq+DDsPupLhU2DW7YgAm8BDPABkvdbn1R9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7V/5DQC; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7V/5DQC"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cbe8119e21so37157526d6.1
        for <loongarch@lists.linux.dev>; Tue, 29 Oct 2024 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730224242; x=1730829042; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BK/pLK7S1V1t6tuat6FFIn60WJ4TxvUKBBBCYp6IBH8=;
        b=G7V/5DQCobR7yNujUQTeY/U9ky56alja8oGjk0QwgZwkkyAs7UkMMR1dNWJ5zzoD08
         xKkHLipVvYyGkemTvi9sqh8rVtwlUsuPcJwH7/CINU+FDjYIy8kpvDK5U4aj/TiaGNGp
         g2lG1+qvaSrTIRGq7l0XHypdWJQhmWNQvKMAFqaSMCohqKauTj9FinPSbEaOPV6SGpRF
         qZwky4wAQmjnPlVkJpCGABkf441iMWui7XS6Po7Q4h3TmWnU1MX4FDaMgtAMOMqPQKFP
         Cai0DuES6X3eDsIm0R2Az6rHbXHmBJljAM6RgcxYSDvWwEk1+h3rGIyMoQjMITHwuzDz
         eGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730224242; x=1730829042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BK/pLK7S1V1t6tuat6FFIn60WJ4TxvUKBBBCYp6IBH8=;
        b=oXTHeW19Hqk859eVNVlTjh3U2B8JTCVhP3w48W6/IFkn88y1v+MEsNp4oyCDl3VqhL
         NgGxCoIs97ygLjOfP8eiVvFA1+Qmx5pPfj2OU+igP1SdTbiGXRbkXBdVdF9pEsiLEvR/
         5mHTnrG18SQ4DaPB30FQyf3EIeC+C2Kkln+p1jzd+y2JK/Lt0ryOZEIFfGOJ08U0JpqL
         yOQ2q2/J+m4kJkqxx7WIu13VgfpFvNlAzgt05/mgrBIHqKCZ1em/W53bbxHJ2BrLSw7N
         fbOT/54WkOyoenUWZ8wTy/Dv75T7DCwiMEQDu5Z9oJbiPiOG8sQBMnzKvMSIxxs4DPI5
         geQg==
X-Forwarded-Encrypted: i=1; AJvYcCVtvFnAK1nx0d++m2d96E547fzkiG0Hma0Ef3P7WvYJQazAuVa0BW28TCWbmCdBF3QAuDAeyj7RtZ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywov7wiUfK/1e71JhgHOtl5kPUoD8uW6lRp9GQWzObMFYrlriEN
	/QP83qXnLtarGojq5eHn3vh2sUR5mrsbGNzrs3B2Z/48pY3rVBQv
X-Google-Smtp-Source: AGHT+IFGMVOBqxcUtZ7Un1nNcyqmn8u2lqCn/vEwPQlMDhoDECiVmLIANcB5IXjL+WWmWp1X0e6goQ==
X-Received: by 2002:a05:6214:4603:b0:6cd:6ad4:1fc9 with SMTP id 6a1803df08f44-6d18585e11emr174482126d6.44.1730224242073;
        Tue, 29 Oct 2024 10:50:42 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a565f4sm43845056d6.138.2024.10.29.10.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 10:50:41 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id AE8D6120006A;
	Tue, 29 Oct 2024 13:50:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 29 Oct 2024 13:50:40 -0400
X-ME-Sender: <xms:cCAhZ5TRRj75IS2Tzjtu63aZzV9zDi1UeLbOZ6_hFfDk7T8qW6AVhg>
    <xme:cCAhZyxQ2PjsZEtNAV0l77rOvuexoFa8akCFADoXqh3RrCMgjGsi0uyAC3xsAL-fn
    RK0gk0-jNsrBOCM1w>
X-ME-Received: <xmr:cCAhZ-0CElQ-ri8IF4FVpuuH9UQmaVHSKBH2w8fJa68UhMEBscThH-OD4OE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekuddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepgeelgeffvdelgedtgeetfeejvdeiueetueev
    gffghfejieeuhfefvedtgffgfeeunecuffhomhgrihhnpehrshdrshgsnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhm
    thhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvd
    dqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhn
    sggprhgtphhtthhopeehfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlih
    gtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghho
    ohgumhhishdrohhrghdprhgtphhtthhopehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepmhgrthhhihgvuhdruggvshhnohihvghrshesvghffhhitghiohhs
    rdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtohepjhhpohhimhgsohgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggr
    rhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cCAhZxCZq3d0UKYNwzqPWrFaA9y-XTAHxm_9BJmjE_XYMRQTg1ygdQ>
    <xmx:cCAhZyhQmFYGDivfUtONNKb8UmOZ0MNrQs5cpxin0J_THuilmJtVpQ>
    <xmx:cCAhZ1qtpMwug643Rt8r_Lup_7vByNKCy-1SOxkaayjBBdtdsyEm6w>
    <xmx:cCAhZ9g8cmPze38Y9VJbL-e8QyQcfXE1cHAdxasFa5rjtWUp949vpQ>
    <xmx:cCAhZ9TEHmr0HPX_vPEOyHq3JSpvWEm8sDab7uXAAslSI5xYvxNgHwSP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Oct 2024 13:50:39 -0400 (EDT)
Date: Tue, 29 Oct 2024 10:50:38 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,	Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
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
Subject: Re: [PATCH v11 5/5] rust: add arch_static_branch
Message-ID: <ZyEgbhWdFa66p-G3@Boquns-Mac-mini.local>
References: <20241015-tracepoint-v11-0-cceb65820089@google.com>
 <20241015-tracepoint-v11-5-cceb65820089@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-tracepoint-v11-5-cceb65820089@google.com>

On Tue, Oct 15, 2024 at 01:14:59PM +0000, Alice Ryhl wrote:
> To allow the Rust implementation of static_key_false to use runtime code
> patching instead of the generic implementation, pull in the relevant
> inline assembly from the jump_label.h header by running the C
> preprocessor on a .rs.S file. Build rules are added for .rs.S files.
> 
> Since the relevant inline asm has been adjusted to export the inline asm
> via the ARCH_STATIC_BRANCH_ASM macro in a consistent way, the Rust side
> does not need architecture specific code to pull in the asm.
> 
> It is not possible to use the existing C implementation of
> arch_static_branch via a Rust helper because it passes the argument
> `key` to inline assembly as an 'i' parameter. Any attempt to add a C
> helper for this function will fail to compile because the value of `key`
> must be known at compile-time.
> 
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/Makefile                           |  6 +++++
>  rust/kernel/.gitignore                  |  3 +++
>  rust/kernel/arch_static_branch_asm.rs.S |  7 +++++
>  rust/kernel/jump_label.rs               | 46 ++++++++++++++++++++++++++++++++-
>  rust/kernel/lib.rs                      | 35 +++++++++++++++++++++++++
>  scripts/Makefile.build                  |  9 ++++++-
>  6 files changed, 104 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index b5e0a73b78f3..c532f48b79de 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -36,6 +36,8 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
>  
> +always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/arch_static_branch_asm.rs
> +
>  # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
>  ifdef CONFIG_RUST
>  
> @@ -424,4 +426,8 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
>      $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
>  	+$(call if_changed_rule,rustc_library)
>  
> +ifneq ($(CONFIG_JUMP_LABEL),)
> +$(obj)/kernel.o: $(obj)/kernel/arch_static_branch_asm.rs
> +endif
> +
>  endif # CONFIG_RUST
> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> new file mode 100644
> index 000000000000..d082731007c6
> --- /dev/null
> +++ b/rust/kernel/.gitignore
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +/arch_static_branch_asm.rs
> diff --git a/rust/kernel/arch_static_branch_asm.rs.S b/rust/kernel/arch_static_branch_asm.rs.S
> new file mode 100644
> index 000000000000..2afb638708db
> --- /dev/null
> +++ b/rust/kernel/arch_static_branch_asm.rs.S
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/jump_label.h>
> +
> +// Cut here.
> +
> +::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))
> diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
> index 4b7655b2a022..2f2df03a3275 100644
> --- a/rust/kernel/jump_label.rs
> +++ b/rust/kernel/jump_label.rs
> @@ -24,7 +24,51 @@ macro_rules! static_branch_unlikely {
>          let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
>          let _key: *const $crate::bindings::static_key = _key.cast();
>  
> -        $crate::bindings::static_key_count(_key.cast_mut()) > 0
> +        #[cfg(not(CONFIG_JUMP_LABEL))]
> +        {
> +            $crate::bindings::static_key_count(_key) > 0
> +        }
> +
> +        #[cfg(CONFIG_JUMP_LABEL)]
> +        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
>      }};
>  }
>  pub use static_branch_unlikely;
> +
> +/// Assert that the assembly block evaluates to a string literal.
> +#[cfg(CONFIG_JUMP_LABEL)]
> +const _: &str = include!(concat!(
> +    env!("OBJTREE"),
> +    "/rust/kernel/arch_static_branch_asm.rs"
> +));
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(CONFIG_JUMP_LABEL)]
> +macro_rules! arch_static_branch {
> +    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
> +        $crate::asm!(
> +            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
> +            l_yes = label {
> +                break 'my_label true;
> +            },
> +            symb = sym $key,
> +            off = const ::core::mem::offset_of!($keytyp, $field),
> +            branch = const $crate::jump_label::bool_to_int($branch),
> +        );
> +
> +        break 'my_label false;
> +    }};
> +}
> +
> +#[cfg(CONFIG_JUMP_LABEL)]
> +pub use arch_static_branch;
> +
> +/// A helper used by inline assembly to pass a boolean to as a `const` parameter.
> +///
> +/// Using this function instead of a cast lets you assert that the input is a boolean, and not some
> +/// other type that can also be cast to an integer.
> +#[doc(hidden)]
> +pub const fn bool_to_int(b: bool) -> i32 {
> +    b as i32
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 55f81f49024e..c0ae9ddd9468 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -148,3 +148,38 @@ macro_rules! container_of {
>          ptr.sub(offset) as *const $type
>      }}
>  }
> +
> +/// Helper for `.rs.S` files.
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! concat_literals {
> +    ($( $asm:literal )* ) => {
> +        ::core::concat!($($asm),*)
> +    };
> +}
> +
> +/// Wrapper around `asm!` configured for use in the kernel.
> +///
> +/// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
> +/// syntax.
> +// For x86, `asm!` uses intel syntax by default, but we want to use at&t syntax in the kernel.
> +#[cfg(target_arch = "x86_64")]

This should be:

#[cfg(any(target_arch = "x86", target_arch = "x86_64"))]

for future proofing and um (usermode linux) support.

> +#[macro_export]
> +macro_rules! asm {
> +    ($($asm:expr),* ; $($rest:tt)*) => {
> +        ::core::arch::asm!( $($asm)*, options(att_syntax), $($rest)* )
> +    };
> +}
> +
> +/// Wrapper around `asm!` configured for use in the kernel.
> +///
> +/// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
> +/// syntax.
> +// For non-x86 arches we just pass through to `asm!`.
> +#[cfg(not(target_arch = "x86_64"))]

Ditto.

With these fixed, feel free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> +#[macro_export]
> +macro_rules! asm {
> +    ($($asm:expr),* ; $($rest:tt)*) => {
> +        ::core::arch::asm!( $($asm)*, $($rest)* )
> +    };
> +}
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 8f423a1faf50..03ee558fcd4d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -248,12 +248,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  # Compile Rust sources (.rs)
>  # ---------------------------------------------------------------------------
>  
> -rust_allowed_features := new_uninit
> +rust_allowed_features := asm_const,asm_goto,new_uninit
>  
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
>  # modules case.
>  rust_common_cmd = \
> +	OBJTREE=$(abspath $(objtree)) \
>  	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
>  	-Zallow-features=$(rust_allowed_features) \
>  	-Zcrate-attr=no_std \
> @@ -303,6 +304,12 @@ quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
>  $(obj)/%.ll: $(obj)/%.rs FORCE
>  	+$(call if_changed_dep,rustc_ll_rs)
>  
> +quiet_cmd_rustc_rs_rs_S = RSCPP $(quiet_modtag) $@
> +      cmd_rustc_rs_rs_S = $(CPP) $(c_flags) -xc -C -P $< | sed '1,/^\/\/ Cut here.$$/d' >$@
> +
> +$(obj)/%.rs: $(obj)/%.rs.S FORCE
> +	+$(call if_changed_dep,rustc_rs_rs_S)
> +
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>  
> 
> -- 
> 2.47.0.rc1.288.g06298d1525-goog
> 
