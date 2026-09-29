Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0824C52BE2A
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706267; cv=pass; b=Zg4hCffie77xWWetnFTF4PiBo47ItWh1uEfdZRuGPgLRcd9ejcvoRhQy/LqFpRiUNz62nVX6H0Bcq+6+dwEvGuOSLZks6Zt7lYbg4xL6sH8z05VZdOOvIOAJ3LphKNHg0f/JDi5JmYSWpG91rLJQ7Bunu6s/X5zajfdChUzdxE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706267; c=relaxed/simple;
	bh=xsSYztuAQh102Qqep6rxJgPu9f3AocHSYQyuiCkTcx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKQaNXSKQmGkLFT/gh88qUjtqi5xI5puX0oyaf2QK91t+oI/rsB2jBPG5OP/VHWEr/N+ysVEdl4scYS7f9gCY7eMjKPE2vHzRtOoE4XkpiBe/KqDCh7yds7xxA6Pz4AFDuZgxmdX8t4vDEdO3gMM5nIkIagHpODfS03ZpAtGOhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ayOlTvit; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ayOlTvit"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso2315657f8f.2
        for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 11:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706263; cv=none;
        d=google.com; s=arc-20260327;
        b=XrVPxLhJwMi4SXlGMd5kALOYfUeAKSzt78MkO9VJYJnVmMbk+u3o4eRlAysjoRGkPV
         Q5MpqJIBsMgkTtPcAKYlfnrbmRa990BBpUpA72uGR6viOLDvpwYtNCEZyCa+IDpGcOU0
         SuzOpjXi8axKfrZtc8hnL/EfD06Buly1hY+VACWpV0OJWRH0JK5xZA1BAZq2QGtcEVyx
         1FSjo9rhCc/mLrIPRB9OykC6+dZdtI7sSJbNPlRQOaPEuUgMA1S8PJT1cTJu+EAWDL4Y
         /qS77PPUzJvu9n0qzkm2q3HLIM241n99+lZORexRX+QtYvRUs8DGLSP8EOGVWo/7rL9a
         8AyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        fh=a2bAvbpMUvGhLw0ZcvXpO6LnqBkiQAcnYDj5ZPGstiM=;
        b=E0c2Pf8oSUgYSj7UythEl1px8mrjxHuXBfkytE32uJ7+HZLap1+fjNf9Nl26oglO7y
         faCh7l59JIXY0ThitX5M832NxUdzB8e0OzEPydX4xrAWTgSxEHFP9pK4nGtiMWPq9N8e
         6t2ULl9f1awS2XEcT8bsPQWe9X7W3a5wlEXNVAWGyR+AB2wdAWf2ypHespq9iCbYiZo+
         xXam4a4XlYGkTxSXEYETsXdwwWxqZx2QA85xW7/i3Lohh6z/GfQJrq59H+EZjpV8RFLV
         PJZZoDzSEvUMjZe+0li7pWplIep00AJddQkMoXsf/fQi/mTQAeR41Lm/YBMTlWXI5g4E
         V7pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790706263; x=1791311063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=ayOlTvitpVIIVg67rbeC24zIJQ0rCX2qZoZ8Wl7wJWGDyos2FEnM0Ffk64ZXF+U50v
         Ce6Brhgv36wIeyA4D4rwpLd0dGhfAVOgyKWFsahZzT6t7Y1d1XkaATcpdHT0cyhq8Rjt
         2dg4Q6bcFo1VSycw2DMe+VaLhtePeE3OZr2U6OlLpD7G0LFURp+0I6iTDzT4ppxaWc6S
         NzosWlN8uv9OgE0BCj3YDuGrPEQau06xVUQ5zD6W6sA0/5Pr0ab8IYIuyG3Mc+hYJERw
         LAbsq/ictuwq4C3myKWoci/LmRdBhWBd99NnsDaVdvXuhGQmtNF7/6GNMmu3/3HjQu7j
         y6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706263; x=1791311063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=H1p9QWpau3EoqaHnnHHsAFHWWFrAZnf/nCR/lvx1R17nu12CS3KwMzmPyMD+sXbvl4
         DqjfXm7uJFyfFlobucTQ50AizjEJAhJ2JFr8cPt4dzKL451+TzdssER0x0BSbCqfwRDI
         J4O8NOiAws7XVfqlP4MDegvhDPmYc7IhjykC/gKhJf7K7AHMVctRmSF3ZL6NcCBi2hh7
         kMeZACilvIQVAu0+qV3zdvk+3rwQ0X3AbrYYFuRs6CmE5TZYzL/rstODGo2lyBHncRs2
         +deoFQ35IsbhtVrzXvadeUJOVYuMaKU2ZfZ54alGb2x2vrDxXTj/vaR0itcoc11pDgq9
         kYcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXela1z7+CvHRWBcNBEeL1vpTtWCLR1F4qoGEoSiJ6iprWVFq6kcuJsy8Qt0Rxw5qDybEk/UTIdsE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKsjPyaFBXwwGunZbKFEZ+F0wGe2AY9ztszoC0zW9VcP0CrU25L
	mcOCcVVjeopixiaSr956n4PrOZ2WnFpg14Jp6igKfJ+eFc+NquT5hpKTARxATKj4jBXuJOiZpGg
	EihyXJIGn1IzD3lw7I9hUJcE2L3arDRNSBeo620ci
X-Gm-Gg: AYBFou1KP4/qZw6x/QXievyaYDvQ5FCaW3JzRXeAKtDJmAeCXeDs2eizV/VErcFCoXI
	VpZFceWrt7RYSkTpOog37NoFIRwiyaWoLtS0pkMDzVVCRjg6/ycWkXBYTSGVAaV2HFJ9MbWpmT8
	Vyx1eqI+mtWPg7hMjY27qI/Ym6PQCqRTPQllomhVKMgrL6o6tLAVDr5TXA2ndEgK5/jY3Oi78eh
	5zL76SikldaPaP3Faq8u2NDmkYUaahkjfIH3dWD5x/Vujng8U3yEjYu9poAIEvjFZ3P5Ugjur16
	oiM/bKK8H84m881eRjFhA8uqu7gxuOv0X9FhRn2rF/DqNf57V5j9YIPXFBah+sQQp5tOACSj1pu
	avkhuj0/GGJVza/QmGE5V1p9LRz+xcszoNgSvV2unYFQq6Pm64InPVKyGwkvqU7jBVsA=
X-Received: by 2002:a05:6000:2381:b0:48a:fba3:d5b6 with SMTP id
 ffacd0b85a97d-48afe7ab8dbmr265943f8f.56.1790706262469; Tue, 29 Sep 2026
 11:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
In-Reply-To: <are6s5e6On3hpD3M@zx2c4.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Sep 2026 11:24:11 -0700
X-Gm-Features: AclHuK_OlHRHmRVZkjU6Ad7ygjuA5O41_jDQwI5Gzaif3nG5KjlJX6HrrO4nUUw
Message-ID: <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Nathan Chancellor <nathan@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:29=E2=80=AFAM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> On Sat, Sep 26, 2026 at 12:55:34PM +0200, Christophe Leroy (CS GROUP) wro=
te:
> > Hi Jason,
> >
> > Le 26/09/2026 =C3=A0 12:02, Jason A. Donenfeld a =C3=A9crit :
> > > Apparently not on RISCV, which is what prompted this patch in the fir=
st
> > > place. So I suspect Nathan's v2 here is the way to go.
> >
> >
> > Don't you have -fno-builtin on RISCV like we have on powerpc ?
>
> I think Nick mentioned this led to other problems and didn't exactly
> solve the problem.

Sorry, been very busy.  Getting blasted from a fire hose of AI
generated patches to review...

arch/arm64/kvm/hyp/nvhe/Makefile has this pattern for exactly the same
problem I suspect.  Maybe that's the right tool in the toolbox?

```
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makef=
ile
index 8dbf2532a573..27fa72d8fb86 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -27,7 +27,7 @@ asflags-y +=3D -DVDSO_CFI=3D1
 endif

 # Files to link into the vdso
-obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o
+obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o ../../lib/memset.o

 ifdef CONFIG_VDSO_GETRANDOM
 obj-vdso +=3D vgetrandom-chacha.o
```
Fixes `make -skj"$(nproc)" ARCH=3Driscv LLVM=3D1 mrproper allmodconfig
vdso_prepare` for me, as per
https://github.com/ClangBuiltLinux/linux/issues/2183
(Nathan, don't forget to link to that in the commit message)
I'm surprised I didn't need -fno-semantic-interposition (or one of the
related flags... -fvisibility=3Dhidden)

If we want to get better, (if performance matters here and we want to
trade source+build system complexity for absolute code perf) I would
start with that, then worry about clawing back performance via things
like:
- __builtin_memset_inline
- -finline-stringops=3Dmemset
- -ffunction-sections+-Wl,--gc-sections to dead code eliminate the out
of line copy of memset, though IIRC there's potential for wasted space
due to alignment requirements (maybe the out of line copy of memset is
smaller...idk)
--=20
Thanks,
~Nick Desaulniers
