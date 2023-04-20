Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BACC8C04
	for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 16:32:49 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54f6a796bd0so48851267b3.12
        for <loongarch@lists.linux.dev>; Thu, 20 Apr 2023 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682008368; x=1684600368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3BSroRGTMjZwdWoqTKLfU1BwyXpXpK1CaYKOa1IhhA=;
        b=i1AYBs8uVK8brvleQAYqQGZPGcHCo8NkcuLi+lk7QlkZRzLXczecbwnHc2vEd3T3Md
         PfbKp6VSZaD3MeOVF4239vPmz3TbDBbw9lq0nXv1fzz7FCAiJlmMDtT1wiTOZVcjDxai
         kPI4A0jTiWieP1nCDhQ4VYXH7W/hwLNrESVTRG/RRIqoDtKy2NiZv2VQR6XyV4Lj9Czj
         nExymAAFbb3YZzvMjuFYCAYrt9itelr661Deu63vXoByzV3rko8BZHgjSwwLK6qCOpfK
         tbnscG88Njr/fQkPfOLtXDoMmB8ENZUE1qk6lIEAUdpwCKVcwfiRpPuxW2zCIDDpzLJF
         Q9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682008368; x=1684600368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3BSroRGTMjZwdWoqTKLfU1BwyXpXpK1CaYKOa1IhhA=;
        b=GI8yyy1V2xfvezPsD93ivQhpYhIvd4Pbqc5J5eKp6saMKxhO8y0lMyoOwyIbeYJudm
         tmsSnzKoZsvtTuVDjSSd3LWz8By/f5JCaZVjTll+OyCNjKAXlEkzmaBU2vtEqLBHdTgh
         UtC/ctLEzMTTTAeVibHi4zwkk6f33kbCDcNatXH3M5Y2nbCGHdKmOCoxyieN5Ymcy+mx
         JMyFIa/57oCz5wrciaSYjEYkT67YppiE+ZF12DpENtU5n96bjufmLz8HEA0j5ASg49/E
         2ZSIRRjmq4Q56UcXysixupJnxOkt1iF4Gyx3Ov3EtGT7ynk2gkgFr/ypZY6H5Stoh8ed
         NiZA==
X-Gm-Message-State: AAQBX9fhNAF91kT14XrHULKZAque/3MlPpG3kwjYMvn5XfepxC2Ark0b
	+os1KvWqpViAFAB4L7yFXH8jn4BxM+4LIapmBy2aaw==
X-Google-Smtp-Source: AKy350bS4Uph/moJnEKQings6CW8NakkSPNVDca75rNKjnPYS7Vm9ht4TnvcuOxwihcePODQeNmC90SYvB3pfCHYWfM=
X-Received: by 2002:a0d:d911:0:b0:54f:5cec:a643 with SMTP id
 b17-20020a0dd911000000b0054f5ceca643mr1364521ywe.41.1682008368023; Thu, 20
 Apr 2023 09:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com> <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com> <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
 <20230419221500.GA17797@alpha.franken.de>
In-Reply-To: <20230419221500.GA17797@alpha.franken.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Apr 2023 09:32:36 -0700
Message-ID: <CAKwvOdkZA6DVCbgF=P1xZcHiyGFTnYvGReJZTzVnmeZdsH0L3w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 3:15=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Apr 19, 2023 at 02:35:02PM -0700, Nick Desaulniers wrote:
> > On Wed, Apr 19, 2023 at 9:50=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
> > >
> > >
> > >
> > > > 2023=E5=B9=B44=E6=9C=8818=E6=97=A5 21:07=EF=BC=8CNick Desaulniers <=
ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Fri, Apr 14, 2023 at 1:07=E2=80=AFAM Jiaxun Yang <jiaxun.yang@fl=
ygoat.com> wrote:
> > > >>
> > > >> LLVM does not implement some of -march options. However those opti=
ons
> > > >> are not mandatory for kernel to build for those CPUs.
> > > >>
> > > >> Fallback -march CFLAG to ISA level if unsupported by toolchain so
> > > >> we can get those kernel to build with LLVM.
> > > >>
> > > >> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
> > > >> Reported-by: Nathan Chancellor <nathan@kernel.org>
> > > >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > >
> > > > Thanks for the patch! Maybe it's more obvious to folks who work on
> > > > mips, but how did you determine that say `p5600` is `mips32r5` or
> > > > `r10000` is `mips4`?
> > >
> > > Wikipedia [1] should fit the purpose.
> > >
> > > [1]: https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processo=
rs
> >
> > Mostly! Though I was not able to verify:
> > - p5600
>
> mips32r5
>
> > - r5500
>
> mips4
>
> > - rm5200
>
> mips4
>
> > - sb1
>
> mips64r1

Thomas, thanks for reviewing datasheets to verify this.

Jiaxun, for SB1, you have cc-option fall back to -march=3Dmips4, does
that need to be -march=3Dmips64r1?

(With that last question resolved, I'm happy to sign off on this patch)

>
> all information taken from datasheets.
>
> > - loongson*
>
> probably depends on the exact type, but as I don't have datasheets
> I can't say what it is exactly, probaly mips32r2/mips64r2.

Oh look Jiaxun, you are the maintainer for
"MIPS/LOONGSON64 ARCHITECTURE"
ok then I will trust your knowledge of this architecture!

---
Separate question to Huacai, Wang, and the loongarch list; I know LLVM
landed the Loongarch backend recently; any idea what's the status of
building arch=3Dloongarch with LLVM=3D1 (linux kernel)?

--=20
Thanks,
~Nick Desaulniers
