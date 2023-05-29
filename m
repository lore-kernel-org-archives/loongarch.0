Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E748BE7
	for <loongarch@lists.linux.dev>; Mon, 29 May 2023 08:31:56 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bab8f66d3a2so4501430276.3
        for <loongarch@lists.linux.dev>; Mon, 29 May 2023 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685349115; x=1687941115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FxycY0EuudHbJCyhRTGcH7IuXekFEZEWmV5CsytKFQ=;
        b=VXpntmCbpolloNLKD8Bi6Ar6EI5uCPaS3KLfIfhu8+wzZpr1SvKjAPZbbpTPiY1oCK
         ylOEr8yeh6pzQRkcLveTW9zTCRwE2mNDVu5uMNKBGptrU9XrHhr1weYnDsucM7H/6IRr
         +awpjTusACIN06pXTaIDOB7Z18ov+VZUqvBMN5egkM1tlEmELGtrpGQAEWToFRiGfV7U
         thqm6VPItIq0PAvkneeR9oHr4NO0n0jN4ewHRK+zCIOBOXxQFItcQQ0VIbbINg1cJgfr
         RFwXnpPpJfBEYwCKPlVrQkTWBhdubgEsqcRt8yMNeb+FGS2auHbVmTJ+lhOrgTLrRmkj
         PwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685349115; x=1687941115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FxycY0EuudHbJCyhRTGcH7IuXekFEZEWmV5CsytKFQ=;
        b=FTnE1l5g3GtXhSxwxTmhAfbjlyVwhVHTmI1wLOzbR/VkK9BooLFxByieR1C26a0h2X
         bHXCTuyt8F4bC2K23XPaM3D13ZTcD0o1elGkYX4T8x33R+GX9LKK4niaHwh8VhJnq8Q8
         +3KhOS7AVpMZl6D+K+IMtFOqZASaCaI2CSKNNfzgy1OrOMux8AblU1aYnjqj9+pA8uwy
         fzttqogt3dyMHDyZG4Azi6Nf2d22fL6uces9Te7j3LmS4qNe1EkgUk0qr9quhDXAyqMh
         Ho9LN98DRPlfGWgUO6y7fYKza59vcGfxNeZtTmFhiQS1njWO5MCWmf3JMCw+Zco04at6
         XaiQ==
X-Gm-Message-State: AC+VfDz9ViASshLM11yBcdeEQIn4zXz/fQ76z5LCY1mh8RPKNe0Z2GXP
	zZvNCosPBIqgTpI+ImcSIy+wGHyPzEIyRuSbvLw=
X-Google-Smtp-Source: ACHHUZ6XUPf4mVUXBHGr8+dvKgOO1fTdQ2NGSgiKVZmkPRy+K60/QlBBts3Tt1FatGAJvNciWpjDnPxQC+3PfleVDuI=
X-Received: by 2002:a25:3607:0:b0:ba7:5005:dc46 with SMTP id
 d7-20020a253607000000b00ba75005dc46mr10014963yba.33.1685349115110; Mon, 29
 May 2023 01:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1684983279.git.zhoubinbin@loongson.cn> <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud> <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy> <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com> <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com> <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com> <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
In-Reply-To: <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 29 May 2023 16:31:42 +0800
Message-ID: <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To: Conor Dooley <conor@kernel.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, zhao zhang <zhzhl555@gmail.com>, 
	Yang Ling <gnaygnil@gmail.com>, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Excuse me.
We have different opinions on how to better describe rtc-loongson compatibl=
e.

Based on my previous communication with you, I think we should list
all the Socs in the driver and drop the wildcards.
This should be clearer and more straightforward:

        { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_config
}, //ls1b soc
        { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_config
}, //ls1c soc
        { .compatible =3D "loongson,ls7a-rtc", .data =3D
&generic_rtc_config }, //ls7a bridge chip
        { .compatible =3D "loongson,ls2k0500-rtc", .data =3D
&generic_rtc_config }, // ls2k0500 soc
        { .compatible =3D "loongson,ls2k2000-rtc", .data =3D
&generic_rtc_config }, // ls2k2000 soc
        { .compatible =3D "loongson,ls2k1000-rtc", .data =3D
&ls2k1000_rtc_config }, // ls2k1000 soc

And Conor thought it should be rendered using a fallback compatible
form based on ".data".

        "loongson,ls1b-rtc"
        "loongson,ls1c-rtc", "loongson,ls1b-rtc"
        "loongson,ls7a-rtc"
        "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
        "longson,ls2k2000-rtc", "longson,ls7a-rtc"
        "loonson,ls2k1000-rtc"

        { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_config }
        { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_confi=
g }
        { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_rtc_=
config }

In this form,  I think it might not be possible to show very
graphically which chips are using the driver.
Also, for example, "ls7a" is a bridge chip, while
"ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
integrate them into one item.

Which one do you think is more suitable for us?

Here is the link to our discussion:

https://lore.kernel.org/linux-rtc/E229B204-1B00-4B24-B4BF-15277682FB4B@kern=
el.org/T/#m6c1ae9b74fceafc4042f7598b1bc594e68e5ec76

Thanks.
Binbin


On Mon, May 29, 2023 at 2:24=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
>
>
> On 29 May 2023 03:59:57 IST, Keguang Zhang <keguang.zhang@gmail.com> wrot=
e:
> >On Sun, May 28, 2023 at 6:22=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >>
> >> On Sat, May 27, 2023 at 10:59:48PM +0100, Jiaxun Yang wrote:
> >> > > 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 17:23=EF=BC=8CConor Dooley <con=
or@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >> > > On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
> >>
> >> > >> My recommendation is leaving compatible string as is.
> >> > >
> >> > > "as is" meaning "as it is right now in Linus' tree", or "as it is =
in
> >> > > this patch"?
> >> >
> >> > Ah sorry I meant in this patch.
> >> >
> >> > Since there won=E2=80=99t be any new ls1x chip that will boot Linux =
any time soon (due to
> >> > Loongson move away from MIPS but LoongArch32 is undefined for now), =
and
> >> > rest compatible strings are wide enough to cover their family, I thi=
nk the present
> >> > compatible strings in this patch describes hardware best.
> >>
> >> I don't see why new bindings being written for old hardware should som=
ehow
> >> be treated differently than new bindings for new hardware.
> >
> >Let me add that ls1b RTC and ls1c RTC are not exactly the same.
> >The former supports RTC interrupt, while the latter does not.
> >So my suggestion is to leave the compatible string as it is in this patc=
h.
>
> Just as a reminder, there are more than ls1b & c in the patch, lest we fo=
rget.
> Also, fallback compatibles mean a compatible subset, not only that two de=
vices are identical.
> The interrupt is passed by the interrupts property.
>
