Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D381DEA5
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 02:27:24 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso2438616e87.0
        for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 19:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689301642; x=1691893642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QjYIpy7xP8DMRQSEFqDvT4XVNXsg22AxVySZOvYUqA=;
        b=MQDGYViNKUs/ToyMwdzEU3VXSEmLtcL4OZwTI9m7eHi9mWiBdORVRyjXtQOvlfUDVO
         G4Amc5c9FRO33I40Uj+Dl1DULQzJyfkfxaHFqk/UOt63fIuAIx+u/HQxPd0V3xzyGFa9
         F1Y9SXBFzi9XdKzOv6r3kmbTFb2G5zUi2U00hceGPaT6EcodYYNYw8R0rbsDhNQRo9p4
         1Hby64kdlJulyDqy+K1+mtrEdwD3ljhV7n+lzhK5GFcgXvcl9sNiy9BY65w53OaA+zHT
         0v1GA294SiSWglcjInogP4MqGzeFl4nvH4umiZsDag4HfSDPfA3qifiPkOt3/jZSftwv
         ugCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689301642; x=1691893642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QjYIpy7xP8DMRQSEFqDvT4XVNXsg22AxVySZOvYUqA=;
        b=hUTJzX3SjKYvptE7jZw2KUChffY/HyHJidM3qy4g95F/JPn43xVeJrOL4Zy9K3fWUU
         0PL4fGHvLiB41hpe6XfpipiefLTVBUjADiqDJgU52iqX7ORaDALKkZEKqS2/Cl3uZzFg
         E5+yosUi/m8qOLAzXMFXpLOJ1XgW3K+aVsnkCBsrIl8r7Ja4SnjSlyKtnFJQBqkrL9jX
         /5mAeNx+E0S2Y92tVcjme9J89JEyZ43YmeEaZ42Z+BFOZHMsdVBUIMdCoIbVBq1dXV8J
         LsCE2gOh4giEYEk+jHpbWR0xAhN2ZF4wgqseW81U7YWsPMh6YKuXbwls/0An/HnkEL+y
         Napw==
X-Gm-Message-State: ABy/qLZ5h26MpzByAtAcpXGj8JcNxIsm52JmS90UESKLXp473D2z/UdT
	20tNzW+hS+Tpjr6AtSRIdG3ZbBgDZJIm42NHjP0=
X-Google-Smtp-Source: APBJJlFUoixFhld5+Sc4wTb/QLucmlL2H0eqJxxPuIDBzcH4KYML2HGrxrU7S13KSW864n/hzAEW5bgKP9buvO0IakM=
X-Received: by 2002:a05:6512:3ca5:b0:4f9:6c44:1bf3 with SMTP id
 h37-20020a0565123ca500b004f96c441bf3mr2958048lfv.62.1689301642370; Thu, 13
 Jul 2023 19:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <98b53d15bb983c309f79acf9619b88ea4fbb8f14.1689215889.git.chenfeiyang@loongson.cn>
 <ZK+wdvepjYPigfOh@shell.armlinux.org.uk>
In-Reply-To: <ZK+wdvepjYPigfOh@shell.armlinux.org.uk>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 14 Jul 2023 10:27:10 +0800
Message-ID: <CACWXhKmPgiPXKJiBJjcAtWbY6Agb55XjqwDKdgiJuP5Se4r4Yw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/10] net: stmmac: dwmac-loongson: Add GNET support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, andrew@lunn.ch, hkallweit1@gmail.com, 
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	chenhuacai@loongson.cn, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 4:06=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Jul 13, 2023 at 10:49:38AM +0800, Feiyang Chen wrote:
> > Add GNET support. Use the fix_mac_speed() callback to workaround
> > issues with the Loongson PHY.
>
> It would be good to document what those issue(s) are, and if they are a
> PHY issue, why they need to be resolved in a MAC driver rather than
> using the PHY driver's link_change_notify().
>

Hi, Russell,

There is an issue with the synchronization between the network card
and the PHY. I believe that I am unable to access certain bits of the
network card's registers within the PHY driver.

Thanks,
Feiyang

> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
