Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348557C
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 02:03:04 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fddd4e942eso7159479e87.3
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 19:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690250583; x=1690855383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jXcFWAgGAflI6kUVxjxEkNlmkyw4QSOaHS8DdvHCGs=;
        b=i6MjFuhFxFhGZJwQwP043dtGCjxRHgIEtvjyb0w8NbNVKbPO5tYR2SvZsTjrM7xKQY
         uwlM3l7pukdL6uCb6XRsllO6IebZCLte/l8pDPgmtQ2ACENK1qSiBWTZ5Ni6IB2VKzg6
         TEWEJfepNUaHfo0fne2LApN/I4DMQzHMh9uCX+E6hSlQR3ECko9/XSzKccvOKVriyiOp
         yrXmkHrM0RuSBCKEm7dm1DON1/81SEFry/wQBwHQfoziXCtDnxJzYyLQt9eJPXseq5g7
         QEaqlrCB07OxftOHUQOjvYKfrZWUqNTbcolz9PPOjdKexlaTIkI70y3MyZReEsFXqPrj
         0xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690250583; x=1690855383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jXcFWAgGAflI6kUVxjxEkNlmkyw4QSOaHS8DdvHCGs=;
        b=HjZVnPuSXLnf+DT8OI0kJOMIfIicOYxzizWAbmocqet+71Sg8lrpt9cs69DF9UA0Kf
         JFEilp6JB8AzcqQ11mfoW7NotjGPzHfHNd4CnWyazhSrtO5RCSuLkiZybsauWGJxvA4+
         +xGsMdBMs6W1gq8YhuzLe7oYUwhMrLf2tvRE17JNA+Hra9W2HHYeWIN8HKQFvdXL++ET
         Nbm5sXowcklzZbiKfLp6EqQ1rhl3rh+HtKHfCxrHEhpwUqlXPmGGJv+xnkFWCm5bQSCc
         1GOH5L1auJC2/iSLjF1VBL48ccqLIgl76RVNAwMRuDXX084mJLIMdKojA0O1kNBBqVsC
         DeEA==
X-Gm-Message-State: ABy/qLb1nnLIl9SVqBiVjq0KSv62H85it89OzSKityCqJpB+NYDBuZ8h
	yu23LzeGZOeLHbjQQV8zw8w82SKhWjnJSspgees=
X-Google-Smtp-Source: APBJJlHClHq8ILDWSvrqrA1ckSZ+wKew32udmYxuo/aAKLTXnHoMwBTe+CBPrB1qhEWorO4SE4k1Jm4AqxW26x0JcWo=
X-Received: by 2002:a2e:3818:0:b0:2b6:ee99:fffc with SMTP id
 f24-20020a2e3818000000b002b6ee99fffcmr6985224lja.36.1690250582501; Mon, 24
 Jul 2023 19:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <be1874e517f4f4cc50906f18689a0add3594c2e0.1689215889.git.chenfeiyang@loongson.cn>
 <9e0b3466-10e1-4267-ab9b-d9f8149b6b6b@lunn.ch> <CACWXhKkX-syR01opOky=t-b8C3nhV5f_WNfCQ-kOE+4o0xh4tA@mail.gmail.com>
 <3cff46b0-5621-4881-8e70-362bb7a70ed1@lunn.ch> <CACWXhKk23muXROj6OrmeFna88ViJHA_7QpQZoWiFgzEPb4pLWQ@mail.gmail.com>
 <9568c4ad-e10f-4b76-8766-ec621f788c40@lunn.ch> <CACWXhKkoJHT8HNb-h_1PJTT1rE-TQxByd98qS0Zka5yg2_WsXw@mail.gmail.com>
 <24d49ab1-c2e4-4878-a4f6-8d1f405f2407@lunn.ch>
In-Reply-To: <24d49ab1-c2e4-4878-a4f6-8d1f405f2407@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Tue, 25 Jul 2023 10:02:50 +0800
Message-ID: <CACWXhKmwjXb_71hmGfKh7NCC3iAhFTB1uEVhY0qq8kz24o3TYg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] net: phy: Add driver for Loongson PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 5:04=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Hi, Andrew,
> >
> > Sorry, I currently don't have an exact timeline for when the OUI will
> > be available. The next hardware version will address these bugs, so
> > we won't be going with this driver.
>
> Not having an OUI breaks the standard. So i was actually thinking you
> should trap the reads to the ID registers in the MDIO bus driver and
> return valid values. Some Marvell Ethernet switch integrated PHYs have
> a valid OUI, and no device part. We trap those and insert valid
> values. So there is some president for doing this. Doing this would
> also allow you to avoid the PHY driver poking around the MAC drivers
> PCI bus.
>
> > > So i would suggest .get_features() indicates normal 10/100/1000
> > > operation. Have your .config_aneg function which is used for both
> > > auto-neg and forced configuration check for phydev->autoneg =3D=3D
> > > AUTONEG_DISABLE and phydev->speed =3D=3D SPEED_1000 and return
> > > -EOPNOTSUPP. Otherwise call genphy_config_aneg().
> > >
> >
> > Well, can I return -EINVAL in the .set_link_ksettings callback?
>
> If the PHY is broken, the PHY should do it. If the MAC is broken, the
> MAC should do it. We have clean separation here, even when the
> hardware is integrated.
>

Hi, Andrew,

I get it. To be honest, I'm not familiar with the hardware, so I asked
the colleague who designed this chip. The real problem is the same as I
described in Patch 10 - the Ethernet controller doesn't work well with
the PHY. If the controller works properly, we can force 1000. Are there
any methods to work around this problem in the MAC driver?

> > Considering that our next hardware version will have the OUI
> > allocated and these bugs fixed, I won't submit this driver in
> > the next patch version. I believe we can just use the generic
> > PHY for now.
>
> The problem with the generic driver is you cannot have workarounds in
> it. You don't want to put PHY workarounds in the MAC driver.
>

Sure, we should not put PHY workarounds in the MAC driver and vice
versa.

This PHY driver was designed to solve two problems at first:
1. We cannot force 1000.
2. We cannot use half duplex.

Now, we are sure that the MAC is broken, not the PHY, so I think we
can solve these problems in the MAC driver.

Thanks,
Feiyang

>     Andrew
>
