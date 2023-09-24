Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3401398
	for <loongarch@lists.linux.dev>; Sun, 24 Sep 2023 12:21:14 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59f55c276c3so21997417b3.2
        for <loongarch@lists.linux.dev>; Sun, 24 Sep 2023 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695558073; x=1696162873; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTfZjqjMpvXRZj3b3a+JLvwqBqzdhBKsQPxsSKfm4jQ=;
        b=g404SB3db4GEla3BYphidUAQ+KWHGJz7LluVZwSlGDaFVwcX7678AmuMOzW/8/Ip/O
         5/XyTQEFLN/sT/OVMSRCplJe1+GQ/eQ9cuttO52+LMJBx+0V5yKTMiJrvC5w6aUgkXy+
         kqTnT6H2DewE+NkVZc/CUgepb78cJBw+U+AwWdhz9DsrtMdCVt/8o79xpeAv+G6eMbaV
         QEULiRtxBPrSeMYBz8NNnI9NDDz1xmRQz9po4Vmg7hugOimX7qYSIuezr6sVqbjOErAj
         5i00AsM7+a/W9yTTHBRyuekKwueaVfxTvsw/qkmjQgzIPDNbRiivz6u0qBmRmOVIZewg
         z2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695558073; x=1696162873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTfZjqjMpvXRZj3b3a+JLvwqBqzdhBKsQPxsSKfm4jQ=;
        b=US/3R+4I0BT+jeidtifNo2tScas581mUKdZFH73kIeivkyQZVJYrvr6eLn4C73BoxV
         nsDyGDPQQk+yUzYfR8jF6G8Rj7XPIinccTWe/SXxTehQzWEKv49E+syqq1gpwQY/G8ZA
         rqE0o75AtohcocSKc6wzaCrNSFslVYDSbrhwMfNxlss2j76aGQb7/GGxsryd7vzIHqTZ
         JpRvEsladrOvGlQhOaw2fW02a8nb/iUj33Iahf7MOuFVcqtLAnEFU/fPnQVRH2E/YrZh
         u3hAcaIqSky45C3/0WtJoBtWHkueM1TIkXCo5S9XNQ4rTMq9J3y92ZJQI8yrdwUOpdwP
         E7Ww==
X-Gm-Message-State: AOJu0YwDSbVW/5IxCwENXMiPPzYCb7RyebXQ89fypXLhhOOq12kqi5IX
	pdvSHRyHLz2pVFj9lT/IFMyekT2WJehLfNagkv0=
X-Google-Smtp-Source: AGHT+IF2jNaWBk87Cb4LztG+3BYADZk5wQU4zwUp4/XjFmSp0zIWGQD+y5IecCnZhP1NNVheMxVGBydqfLx6BDN44Oo=
X-Received: by 2002:a25:a048:0:b0:d43:a84f:a6aa with SMTP id
 x66-20020a25a048000000b00d43a84fa6aamr3813704ybh.39.1695558073705; Sun, 24
 Sep 2023 05:21:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1693623752.git.zhoubinbin@loongson.cn> <16a37f6ad3cc9417b6638c2cd532d88c79468eb1.1693623752.git.zhoubinbin@loongson.cn>
 <885eab85-2c11-cf20-9187-55cd647fbe9f@infradead.org> <c7604f6c-4da7-47c4-abe9-e626b3efc665@infradead.org>
 <20230919-9ce82588fccdd641574b468c@fedora> <CAAhV-H73kp8zWJD7AKUvknmxow=f_cPBw9jctpmced6o_QCF6w@mail.gmail.com>
 <ea9ee2dd-b71a-4c97-a347-20536d7ad424@app.fastmail.com>
In-Reply-To: <ea9ee2dd-b71a-4c97-a347-20536d7ad424@app.fastmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sun, 24 Sep 2023 20:21:02 +0800
Message-ID: <CAMpQs4Lp1y1=hp_Z7zRV7W0WCB047yDD5eqnuLHjdqHYZpchRQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] soc: loongson: loongson2_pm: Add dependency for INPUT
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Tue, Sep 19, 2023, at 12:15, Huacai Chen wrote:
> > On Tue, Sep 19, 2023 at 11:48=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> >> On Tue, Sep 19, 2023 at 08:36:50AM -0700, Randy Dunlap wrote:
> >>
> >> Seemingly this was sent again in isolation 2 weeks ago, but neither th=
e
> >> maintainer (Huacai) nor soc@kernel.org were on cc:
> >>
> >> https://lore.kernel.org/all/20230905123629.4510-1-zhuyinbo@loongson.cn=
/
> > v3 indeed cc-ed soc@kernel.org. :)
> >
> > Arnd, could you please take this series to the soc tree? And also this
> > series:
> > https://lore.kernel.org/loongarch/cover.1693534134.git.zhoubinbin@loong=
son.cn/T/#t
>
> Sorry, I have been traveling and not pushed out the tree yet.
>
> Can you confirm that the input dependency is required for 6.6
> and the other series can wait until 6.7? When you send patches
> to soc@kernel.org, please always mention which tree you intend
> them for. I might disagree, but it's better than having to guess.
>
Hi Arnd:

Thanks for your reply.

As we know, this driver was just merged in during the v6.6 window, and
no release will use it until now:

commit 67694c076bd7 soc: loongson2_pm: add power management support
commit 6054a676e969 soc: dt-bindings: add loongson-2 pm

Now, since the Loongson-2K series SoCs are indifferent at the driver
level, we used fallback compatible and added
syscon-reboot/syscon-poweroff subnodes for power on/off functionality.
These somewhat break the original devicetree rules.
So, I think these patches need to be merged in before the v6.6 release
to avoid unnecessary compatibility issues.
Of course, I added the "Fixes:" tag in the corresponding patch.

Thanks.
Binbin

>      Arnd
