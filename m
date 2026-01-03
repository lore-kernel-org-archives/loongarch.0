Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A09A2882AA
	for <loongarch@lists.linux.dev>; Sat,  3 Jan 2026 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767442511; cv=none; b=RIDzEUf3WIHmjqsqvblOyOc2s+WvoLwIgS43NqvV+xOmk4t3XtHvOGrc8+BdfsfVfTcm4sqMhRHnZnqXtKlOVASyFAwlEGYTrizeAeO5DX2AFrz1D27jZ+CXjdhJkA1CegnxclQse7mfJcF4zP/+SKlPBUTzkPSFGXR4f/RJTuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767442511; c=relaxed/simple;
	bh=ScVTnTxnS4MitNX89pIhAWFQE70UKJmQcXTuOT/ApqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUPkwJFt6zNdsczW/w4D6rb1CWNwVbuYl4N7qg8yHG9N2nLT6vXO/2XK0r3K0raPvazxmZrXgxdyN6QAaxc+6ofb1kmGadA+5yIQPJSPqfaV/Yn1t4EXbyfXzaWEaruLARIKHDePlqHqRYSmv1wC2ZtTkMq2nLck8ABNgBBApLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiqwlWy0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiqwlWy0"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so590627e87.0
        for <loongarch@lists.linux.dev>; Sat, 03 Jan 2026 04:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767442507; x=1768047307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AGEQXVff4Cjra/LEG8aFJKzdBMi+jbn5H5NG2dDiwk=;
        b=ZiqwlWy06qQAGVsPmFZRFCW+nQdeMAQHvYswEFczsBNYV4sdvtwWDkDAUpHw0mIDEg
         IAC9/8ya2oCeb1vUceVLRo0gpEUPQMe89sqguv47Fr/9Mq/ND3n38Ka+hywn6uhEoMk4
         0mahqkSxsL/DBQgcgR6cv0vp6uYWnOSolgBMKT10FqsKCH7SdK8B1EoC0p3fzNELRAPe
         pYtabS1Rn0FZnDpIvJ6Nj4nKw3UqRoXa0l16U4zmj5U3SY7bCjDpi2vSxsvasSB1X2+p
         1/LTBG1nl6Hub/uStEkrT+WoivB7X69RoVRSOVE2aI9fkMl5+bjr9UMlE9lJPN+iAWxX
         a7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767442507; x=1768047307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AGEQXVff4Cjra/LEG8aFJKzdBMi+jbn5H5NG2dDiwk=;
        b=hOTSznSLRTSrR6pmMNFCbpyrLEM5b+tc4RBYZgvKw9KtpmWDmGirVDjSeP0udbVToG
         ll/IzufUfg9IzzQRuLMrhwHBM4ChtVb4UvuMQzHR8Hl9zzg4r+mMjdyJj+rsRrJTAILf
         GtdCfMwShJoqs3JmPVVduBpPOCw3AMfaCE03/2U3Am5oxSzQo7zW0X9Tr7SABFBCk4nT
         f4BD39cWdPz3gwK6aAKNzi1kaenk7aKjcdN2fJqdJGyoF9WjbtkDs15JNrXi028oLifn
         9egV5tv7oiyF2yjK2Whi51Av56rj76KWuAbg6KeUYCWMpT71xfvYBqIkNgodjod+nmzV
         dLMw==
X-Forwarded-Encrypted: i=1; AJvYcCVc83YylPfhr2P4v25xsdnvwiwMaLyNQvxCmu1RPHFwWQyg21xigRvTim5wLha3vyGHZft9zzS17Fo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMUV8eKOP78ScmRBGda4gSO27TePezYUqs27hePkkHEsbP3ffA
	JXpubx+A8OnlkIGOB81tm0QPxl34ukF2DbX/mLTUqZMgaXi5G9P+IhzoCO/ifQ==
X-Gm-Gg: AY/fxX44zEZUkcF3lYEt/MRmyG//LIMnkQjI3nsmxToQ4uizCywR50PzRIThFDCuMqb
	BSue8Sh/6csQ963kUrRlfHCz8ZZjHoGmw5qO97cp29CC5kBd1iv2s6wsEDO6S0Hb/jcoEFFEtd+
	nOjR8xvv74eQ7TG4iOSYjKAgazMBKn6McguAXOV5m0dBAX67A1b2GeHPT8GDViDg1Xs8w0K+HHP
	+gZZvNrhw1yIHKM+Cy81UVPCxEb6FYNcQf2BgKRssfneNSaTbJpY8fA6qnnZSC1SIDmn4DBiV7k
	tVXK9IiyJ9NDHwP7PdQhaeUeOtbYITbmiasZ8mrI6RUXdyarhsUpBM+Otu9SkDCNDNXYaVwDfVa
	NmsQr4wFpOtm+YU+P7oXkUccEOCG/X0TT++26F+wPPPQ6BE5KdBN4bG8C/VFwEQsQQY8e6xUZ+A
	Gg/eMmL87v+f+fGTrIMpepGFu7kcBxQsHZhmIFBbVhDp6+Xaekqg5v
X-Google-Smtp-Source: AGHT+IGuPwj5c90N/yOSzvW/fHyvSi9BbZ6Md54mttsoAORSkjxjxsJYQaWeJvjkrO56uLXSAEKKNQ==
X-Received: by 2002:a05:600c:198a:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d6c803ca7mr16959765e9.14.1767437190097;
        Sat, 03 Jan 2026 02:46:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c0c148bsm13448405e9.18.2026.01.03.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 02:46:29 -0800 (PST)
Date: Sat, 3 Jan 2026 10:46:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Message-ID: <20260103104627.2f385d20@pumpkin>
In-Reply-To: <719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-3-ryan.roberts@arm.com>
	<CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
	<719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Jan 2026 14:09:26 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 02/01/2026 13:39, Jason A. Donenfeld wrote:
> > Hi Ryan,
> >=20
> > On Fri, Jan 2, 2026 at 2:12=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.c=
om> wrote: =20
> >> context. Given the function is just a handful of operations and doesn'=
t =20
> >=20
> > How many? What's this looking like in terms of assembly?  =20
>=20
> 25 instructions on arm64:
>=20
> 0000000000000000 <prandom_u32_state>:
>    0:	29401403 	ldp	w3, w5, [x0]
>    4:	aa0003e1 	mov	x1, x0
>    8:	29410002 	ldp	w2, w0, [x0, #8]
>    c:	531e74a4 	lsl	w4, w5, #2
>   10:	530e3468 	lsl	w8, w3, #18
>   14:	4a0400a5 	eor	w5, w5, w4
>   18:	4a031863 	eor	w3, w3, w3, lsl #6
>   1c:	53196047 	lsl	w7, w2, #7
>   20:	53134806 	lsl	w6, w0, #13
>   24:	4a023442 	eor	w2, w2, w2, lsl #13
>   28:	4a000c00 	eor	w0, w0, w0, lsl #3
>   2c:	121b6884 	and	w4, w4, #0xffffffe0
>   30:	120d3108 	and	w8, w8, #0xfff80000
>   34:	121550e7 	and	w7, w7, #0xfffff800
>   38:	120c2cc6 	and	w6, w6, #0xfff00000
>   3c:	2a456c85 	orr	w5, w4, w5, lsr #27
>   40:	2a433504 	orr	w4, w8, w3, lsr #13
>   44:	2a4254e3 	orr	w3, w7, w2, lsr #21
>   48:	2a4030c2 	orr	w2, w6, w0, lsr #12
>   4c:	4a020066 	eor	w6, w3, w2
>   50:	4a050080 	eor	w0, w4, w5
>   54:	4a0000c0 	eor	w0, w6, w0
>   58:	29001424 	stp	w4, w5, [x1]
>   5c:	29010823 	stp	w3, w2, [x1, #8]
>   60:	d65f03c0 	ret

That is gcc, clang seems to generate something horrid (from godbolt).
I'm not sure what it has tried to do (and maybe it can't in kernel)
but it clearly doesn't help!
.LCPI0_0:
        .word   18
        .word   2
        .word   7
        .word   13
.LCPI0_1:
        .word   6
        .word   2
        .word   13
        .word   3
.LCPI0_2:
        .word   4294443008
        .word   4294967264
        .word   4294965248
        .word   4293918720
.LCPI0_3:
        .word   4294967283
        .word   4294967269
        .word   4294967275
        .word   4294967284
prandom_u32_state:
        adrp    x9, .LCPI0_1
        ldr     q0, [x0]
        adrp    x10, .LCPI0_3
        ldr     q1, [x9, :lo12:.LCPI0_1]
        adrp    x9, .LCPI0_0
        ldr     q3, [x10, :lo12:.LCPI0_3]
        ldr     q2, [x9, :lo12:.LCPI0_0]
        adrp    x9, .LCPI0_2
        mov     x8, x0
        ushl    v1.4s, v0.4s, v1.4s
        ushl    v2.4s, v0.4s, v2.4s
        eor     v0.16b, v1.16b, v0.16b
        ldr     q1, [x9, :lo12:.LCPI0_2]
        and     v1.16b, v2.16b, v1.16b
        ushl    v0.4s, v0.4s, v3.4s
        orr     v0.16b, v0.16b, v1.16b
        ext     v1.16b, v0.16b, v0.16b, #8
        str     q0, [x8]
        eor     v1.8b, v0.8b, v1.8b
        fmov    x9, d1
        lsr     x10, x9, #32
        eor     w0, w9, w10
        ret

The x86 versions are a little longer (arm's barrel shifter helps a lot).

>=20
> > It'd also be
> > nice to have some brief analysis of other call sites to have
> > confirmation this isn't blowing up other users. =20
>=20
> I compiled defconfig before and after this patch on arm64 and compared th=
e text
> sizes:
>=20
> $ ./scripts/bloat-o-meter -t vmlinux.before vmlinux.after
> add/remove: 3/4 grow/shrink: 4/1 up/down: 836/-128 (708)
> Function                                     old     new   delta
> prandom_seed_full_state                      364     932    +568
> pick_next_task_fair                         1940    2036     +96
> bpf_user_rnd_u32                             104     196     +92
> prandom_bytes_state                          204     260     +56
> e843419@0f2b_00012d69_e34                      -       8      +8
> e843419@0db7_00010ec3_23ec                     -       8      +8
> e843419@02cb_00003767_25c                      -       8      +8
> bpf_prog_select_runtime                      448     444      -4
> e843419@0aa3_0000cfd1_1580                     8       -      -8
> e843419@0aa2_0000cfba_147c                     8       -      -8
> e843419@075f_00008d8c_184                      8       -      -8
> prandom_u32_state                            100       -    -100
> Total: Before=3D19078072, After=3D19078780, chg +0.00%
>=20
> So 708 bytes more after inlining.

Doesn't look like there are many calls.

> The main cost is prandom_seed_full_state(),
> which calls prandom_u32_state() 10 times (via prandom_warmup()). I expect=
 we
> could turn that into a loop to reduce ~450 bytes overall.

That would always have helped the code size.
And I suspect the other costs of that code make unrolling the loop pointles=
s.

>=20
> I'm not really sure if 708 is good or bad...
>=20
> >  =20
> >> +static __always_inline u32 prandom_u32_state(struct rnd_state *state)=
 =20
> >=20
> > Why not just normal `inline`? Is gcc disagreeing with the inlinability
> > of this function? =20
>=20
> Given this needs to be called from a noinstr function, I didn't want to g=
ive the
> compiler the opportunity to decide not to inline it, since in that case, =
some
> instrumentation might end up being applied to the function body which wou=
ld blow
> up when called in the noinstr context.
>=20
> I think the other 2 options are to keep prandom_u32_state() in the c file=
 but
> mark it noinstr or rearrange all the users so that thay don't call it unt=
il
> instrumentation is allowable. The latter is something I was trying to avo=
id.
>=20
> There is some previous discussion of this at [1].
>=20
> [1] https://lore.kernel.org/all/aS65LFUfdgRPKv1l@J2N7QTR9R3/
>=20
> Perhaps keeping prandom_u32_state() in the c file and making it noinstr i=
s the
> best compromise?

Or define prandom_u32_state_inline() as always_inline and have the
real function:
u32 prandom_u32_state(struct rnd_state *state)
{
	return prandom_u32_state_inline(state);
}

So that the callers can pick the inline version if it really matters.

	David

>=20
> Thanks,
> Ryan
>=20
> >=20
> > Jason =20
>=20
>=20

