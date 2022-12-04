Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4212017C1
	for <loongarch@lists.linux.dev>; Sun,  4 Dec 2022 04:50:53 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id v206so10648915ybv.7
        for <loongarch@lists.linux.dev>; Sat, 03 Dec 2022 20:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll505mTuuhfLc1+XZSIHO0whLDL6v0gWWrPnec0ii4Y=;
        b=k5mVMRjqX7Si5uG9z+Uscvrtps9Lm4l+J08vtkBLLMictjduN7yw83tsE++Hu+Y+Aj
         tzGMjHp1B1DVBsHBeaAno3yi2BVO1izqPQNjfE9efhoNad2WkUqtmN+u5ck7CRIJRDjF
         YM/dl+7BGD8/nxeEUA1XSJ81WAfcs6vkCLEGMF0P2bL6CTiqD6TUfX0qPUwprGQelNlI
         Y8aZ2lCfq+dEaYid+X7MscI8qzgPVVQAZJUwygBrxro7blbU3pOBNekJtI9+G2UshZ3G
         GHc7S9u550foOhzqlp8cvkhkpghQSTF1P8bew1u3cg2NPkmwUqUch+maLgoYjzwwvL3H
         yPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll505mTuuhfLc1+XZSIHO0whLDL6v0gWWrPnec0ii4Y=;
        b=tvYI+LMB3dZ5pSlv8RmhyLS4ztLSHFnZ/19wXEO4wbNq90cr+tFfp8tIDDLWAtbA0o
         3icrYcGcbUKvnYlV4MW+a9MfKYG+hWpXLJdrpBNJ4jn1n83zNOvh80ecUxD4zicPVOUV
         bf5LE6SLXNjzVE3npsHq9Qlku1CpCXF09XBDJ0OizaqUhvhydSxf2C4WS3oiJaTP7XSz
         pzH6tV6qIz1NIHnCt+UwhTzxyrbSar76YZwpHqLG+VPUBhNNY8gSYQgxMLVsO513t1hi
         127iE5omJwkF0QhI2LRUTqznq09FMl38iXW6GBInhfqtrpLosd3nvG4DT1TCYRxBYAzl
         1otQ==
X-Gm-Message-State: ANoB5pklNuD9FO67Et8/tsv6IP3z/ElHeVeewSFlP8ZJ6ZsR0ddpaAFC
	QkBLlrmPs5lE51gmrICGoR9gmF0qpfv07RTVEsxPrg==
X-Google-Smtp-Source: AA0mqf52pBcclC9lDKWIBghKNsRoQBaHiaJZlm0JdUCM7v2WBwAs6EPMpN3sOutADe/7qyKy21QWPgWJqBBadM6ij9I=
X-Received: by 2002:a25:ae08:0:b0:6fc:e336:3785 with SMTP id
 a8-20020a25ae08000000b006fce3363785mr10299755ybj.166.1670129451952; Sat, 03
 Dec 2022 20:50:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220830193701.1702962-1-maskray@google.com> <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu> <20221115004625.x4wl6zbg4iiuxl5t@google.com>
In-Reply-To: <20221115004625.x4wl6zbg4iiuxl5t@google.com>
From: Fangrui Song <maskray@google.com>
Date: Sat, 3 Dec 2022 20:50:40 -0800
Message-ID: <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 4:46 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2022-11-14, Christophe Leroy wrote:
> >
> >
> >Le 28/09/2022 =C3=A0 07:25, Fangrui Song a =C3=A9crit :
> >> On Sat, Sep 10, 2022 at 12:53 AM Fangrui Song <maskray@google.com> wro=
te:
> >>>
> >>> On 2022-08-30, Fangrui Song wrote:
> >>>> The actual intention is that no dynamic relocation exists. However, =
some
> >>>> GNU ld ports produce unneeded R_*_NONE. (If a port is not care enoug=
h to
> >>>> determine the exact .rel[a].dyn size, the trailing zeros become R_*_=
NONE
> >>>> relocations. E.g. powerpc64le ld as of 2.38 has the issue with
> >>>> defconfig.) R_*_NONE are generally no-op in the dynamic loaders. So =
just
> >>>> ignore them.
> >>>>
> >>>> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS =
is a
> >>>> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which =
are
> >>>> not called "absolute relocations". (The patch is motivated by the ar=
m64
> >>>> port missing R_AARCH64_RELATIVE.)
> >>>>
> >>>> While here, replace "egrep" with "grep" as "egrep" is deprecated in =
GNU
> >>>> grep 3.7.
> >>>>
> >>>> Signed-off-by: Fangrui Song <maskray@google.com>
> >>>> ---
> >>>> [...]
> >>>>
> >>>
> >>> Ping.
> >>
> >> Ping^2 :)
> >
> >Can you explain which ARCH_REL_TYPE_ABS can be removed with this change =
?
> >How is the verification done if ARCH_REL_TYPE_ABS is removed ?
>
> All ARCH_REL_TYPE_ABS relocation types can be removed. As explained, the
> real intention is to check no dynamic relocation, and this is done by
> the new
>
>    cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q "R_\=
w*_"; \
>
> in this patch.
>
> grep -v _NONE is to work around some GNU ld ports (and likely older relea=
ses
> of some ports even if their latest versions are fixed) which produce
> unneeded R_*_NONE dynamic relocations.

Ping :)
