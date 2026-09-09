Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6F93DA5A9
	for <loongarch@lists.linux.dev>; Wed,  9 Sep 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982710; cv=pass; b=Qt/dCkt88zQQLUkvpN9b5ShgRUunDD956GTwg33tpu/b/cczm+vdm4h6Kft4zFG0+yN/KSnqhXiDSEJlBznqmge680X6zOms7HkIzDKR/HkseOeJRsnx/D5Z51FGPhvvpLvXehK8EGoa9qK/zuzUu3SEsxnO9L9Fg07iiE0jlXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982710; c=relaxed/simple;
	bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orUhL2UV51mSG3RVPMymMoBsWtRvpe8Nz7ChAmLPlllz/e8KiZ5Zz2BctuK++n/VfHXFA7JnvswCamm8GczoGMfga9XNwT1WNgL4jEuhVSlAIajld3H4PC4011lQXoPmZebyLTEKKy13oqtCn2KWYBicgd2p0cW1PzYVS3jTtKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMPnQK/7; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMPnQK/7"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d81cso4376435ad.1
        for <loongarch@lists.linux.dev>; Wed, 09 Sep 2026 12:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788982705; cv=none;
        d=google.com; s=arc-20260327;
        b=ZZgaYXbAEpVxgWqfLzo2UisO4C5J+21s8LFpFc4WxsbpriwundVJvjDlL/Wswqaj8u
         KbCfl3m0fKxVvXq7Y7FVLiQ2fvJ1mQVgIPr6YFdTlni5/zMB9a1Wml7XiMVMRL1xT5/O
         pdtaPivi2gYCu50DFf3WpUDBenVmtl+BSD2nfFLAEe9mtvVZ+klO8tNxYO9ksdd8c+bs
         fvMXZ4EhATnHciymUL76z9fHPvsod+zyoRIKtGn/glbiH/EP3Fc+PoyDeoCt3jEBXqZh
         /sUpQs5qWQhpGNWxHrt0cWUQ38qJtd1rHtVZfO4xr0gbNuqxsmBK6PWBRYeJoleC/+IK
         3/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        fh=6BatJWFjx1X1e5+vkbftJzOM7MxmA+vVtO3pJ/HIh/8=;
        b=YuJUxVtTexAwSzRgkXSo71ez6u0SY1PCSPpOJYLw9z2Q72TZZsvOpwk6WRKrlWzis4
         Ql/rW+5Evae/cblqBXmqwEDyeKqREyeu+aEg3+dE9A9xrqPeYK/Bz/qVQtitt5pHViuv
         jrDbMzsUaHbsoRdSDQK2GyU9xH1aIWqFjfsBqUGSzPtHhxYXJL45f+5+pHIMKfe8Auqu
         23Iw6KC/MIQ1ZLleZ18ZUMH4QAibs+/FLFE7ZrhxuC396lIiMsMUiSwoLuUSSkAzycDS
         HLZuFV26DX/+a2k0Tl/jhufmAoxctoeeSHMbn6LtoX1J3Ib0w/6kcfE//7mMjr+8qIdk
         8UZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982705; x=1789587505; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=SMPnQK/7STCJa7tLv8JQ77Pw8KjjhBCHbKgq+W1ebwQQUxdS4uDMSo6pNPGsjiWVRT
         u05ZvgCVEqphnjLjmC+eqSDDcEe7MeLFlZcB7x0lbfNz8RRFTp1KNFtWlvfG1Mds8U5P
         SH/yyrTHIZvBZaF9Ofv5bnddtePhg4gll7SaQ381VLlwuKTeVW3W5KzNlA/Q9JSTCmj6
         8g77kdKvW06GKfK4NJcFUsmo3OAXoztPXL65j7Gi5jaCKz0EEVZuEyR15K2m+NwJnXac
         VC5P3nthuapLRogfShiNxcTZGo/FIdtyJvOp5hWlmhABb33YwbhHWeeimIU2HoBQLDmF
         V5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982705; x=1789587505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=H9ZlDi9w6RlQrlEgNuOBZ6Z7vZ4s+fnGuczEFJMVUDjFgGblf3M8eiwoMG4ojvWcyE
         pL8b2wu+eMbSE0aE3p15esOAom1/duDNT5IWZ0Ugeb+Q0WuxfQVejh6KDzUEUNT7tqXU
         v+TaTOLxv/GnfeGKs9AgErtctx1siUs6AaTgOSxwncrXs4xtt0paA6GYH0CniLQ5rBKA
         JFWxajXb7wv/PGjFdgDMvs9Xl5h6ZND55qZNElfIjgoVyb++YyXmbqhZcYs2fYj4WVC+
         18SkJv3uXkmO2WtspLLFJfusSO6ehpskGkpi6zMPsT8gSftzrW8RNCu6/NHGKCJ2Bitt
         1t4g==
X-Forwarded-Encrypted: i=1; AKwUvBxhUpo5XnnrtPmJCRiMusP4D70LFzmx+hzwhZ3ygNs4Q4D5tgMC2jXzJLq6Jg08VG2EblnmYZ0LSWA=@lists.linux.dev
X-Gm-Message-State: AFuF++mNtOD/HprxUjTIInKKOYMdQptafgTQ8pUTtIjH4pKHJYeBOShs
	2xFcYUAc8oLd4I//7TlHoS6Xfu/iGAj4xDQgL4h8zxzVcipNnBT5C07XBYOaYM1OV8TP84fgLev
	+owSIwBrtjYDZ5wY6waHgQHrHFjZvsMg=
X-Gm-Gg: AYBFou31xOtEgT/97Qnv9nZ85Y0pZz7j7kaPV8gu5moqKa2oJL2yVTaYZufe69IsV6J
	R/X7QU3BV4y5BO2VtufQ0WeC+jaAfKbe4z2xu1KQxpt3XG06UJ64HSL9g3P1F8q78ITwTdTyMuJ
	fwjq86YF68+guBmL6qijUlWUiaXuOiNU1uL4nb1vPu3IQ/sjTiqicxMnUxoBbPO/S+obVcnPQ66
	FOtYmOsOwZ5tGUVeCja+s66fg+4OwurADdvrpCVQ2R78ixDQNhuYcZOIFIciGeeoEYvw7oWqNYi
	z2fMP/3PsH2IO39q5W6jhNGT77iNqKlFPdOSH5YCtx9i6RzjySL+QzL1RQN8ZvrfWk0cksHlHSY
	/M6fjTBmeyyd44iJFgYs7fB4xD4/3b3IuBZVVvmVET8mQ+1JNlD62akkHsVghK/8iwh2xoiMR3f
	ac7eyR3rQhQwDuu+P5RFc7uXviLwT4G44+jERtkLdNCbI1GBBfi/s=
X-Received: by 2002:a17:90b:3fcc:b0:39b:3505:c72f with SMTP id
 98e67ed59e1d1-39d77b83048mr824934a91.6.1788982705356; Wed, 09 Sep 2026
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
 <20260908071911.GU4120091@noisy.programming.kicks-ass.net> <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
In-Reply-To: <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 21:38:11 +0200
X-Gm-Features: AcwNN1V9A4D3jn7pum7crGv8bcA9jfLyy60O95H9hOe-jZGhQ7AzCwKSAv7z5Dg
Message-ID: <CANiq72=T1487Y7TpAa4c2eTJFMLHoe5Qc7+tRkbkmvrDjfmuvw@mail.gmail.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:33=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> It was going to happen, and now we'll have to suffer the instability of r=
ust...

What instability?

Cheers,
Miguel
