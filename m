Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436615CB8
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 07:54:31 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so67317131fa.0
        for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689580469; x=1692172469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZSBd91l9FNsoBWVb9MzxA3Uq4ofSW5cSlRh40pUiQk=;
        b=IW94wvQ5HIaX+HQfYIRd395f9Jz97urs+aA4EiV0ktMZLxdkEDlD+PldNzTG9JNiny
         RtHygeaWia6NLjdICYkJBjYMzDlHR4ar+HWFJgCFqq/obGuWJr8Lj5XKzDLJ7xB8/FCS
         1a2vhEQD9LrxbxMYeEI0NvZfEk2dY+OaKqyl8FX6cvCkhAX47GKbSS6iqO7XYwWz1sz5
         2D48miHERFsp2djM7UA/bUsYNM9x+PWQQ0rzcx9+aQOHfjn5Aikj18xYpD08Xc2y42Wb
         NH4N5W3lyb/9NpD4yvy79ta6uPJwQBV7VAWu56Z2raWd1YQ/fP/b83oiSDDHGt+YDGgu
         R8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580469; x=1692172469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZSBd91l9FNsoBWVb9MzxA3Uq4ofSW5cSlRh40pUiQk=;
        b=AWfpLkThm3DJu+4ZhiJdW5POLOgtCl0gwAOHu3nNf3JGVjOX1+C8jHZUK9m7aIG+/9
         Nji9c1WvuQh8sGaelfr2ij+s39x3dZ1wqT3279bdmdjIsjSjs9mTipGFu0pKdQjabN8l
         ewB9D8QnOKfT/+LzbYx5EVoXwMewn7ViayETkzCIfaMCyNgu4QWKItRn7GLJ0Qad8eqB
         mnXqfhIfHY7uNSyTO0MI5avmvfaVbFRPGZRRIJ9eq9txBR3PTL/IeqDojNR3xMgnUFqp
         JFPNGo8hB03IBUy99j68qQLJETjiBichJCwGnmywwTNjosMP9k0F5B05if/z+RoIv+Wm
         Qd2g==
X-Gm-Message-State: ABy/qLZ7wGedas6YxrMgYXQiHlKU7dhPvHHLrwTA8Jw9aEfBn7lcV6V6
	BHOjcjBl+nKYIuYdJjXX7fNc5FH2wmeYaMtm6ks=
X-Google-Smtp-Source: APBJJlHkWSMUXS4UBL74h9kbGuWgo5PkhE7BDL9rPNe9ixI+NMu6TeZ/CeSZFhe8qMy1rMCCluWE2GbEY685B/4KUAo=
X-Received: by 2002:a05:651c:3c1:b0:2b6:ef8a:d98d with SMTP id
 f1-20020a05651c03c100b002b6ef8ad98dmr3171003ljp.20.1689580468883; Mon, 17 Jul
 2023 00:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <98b53d15bb983c309f79acf9619b88ea4fbb8f14.1689215889.git.chenfeiyang@loongson.cn>
 <e491227b-81a1-4363-b810-501511939f1b@lunn.ch> <CACWXhKmLRK5aGNwDyt5uc0TK8ZXZKuDQuSXW6jku+Ofh73GUvw@mail.gmail.com>
 <ZLELE5ysytsynpjr@shell.armlinux.org.uk>
In-Reply-To: <ZLELE5ysytsynpjr@shell.armlinux.org.uk>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Mon, 17 Jul 2023 15:54:17 +0800
Message-ID: <CACWXhKn6Tv+Fk9Nxc-kQKkF847+ZAO1uVxSYkMoaiCaeGYCXzg@mail.gmail.com>
Subject: Re: [RFC PATCH 10/10] net: stmmac: dwmac-loongson: Add GNET support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	dongbiao@loongson.cn, loongson-kernel@lists.loongnix.cn, 
	netdev@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 4:45=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Jul 14, 2023 at 10:24:37AM +0800, Feiyang Chen wrote:
> > On Thu, Jul 13, 2023 at 12:07=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> w=
rote:
> > >
> > > On Thu, Jul 13, 2023 at 10:49:38AM +0800, Feiyang Chen wrote:
> > > > Add GNET support. Use the fix_mac_speed() callback to workaround
> > > > issues with the Loongson PHY.
> > >
> > > What are the issues?
> > >
> >
> > Hi, Andrew,
> >
> > There is an issue with the synchronization between the network card
> > and the PHY. In the case of gigabit operation, if the PHY's speed
> > changes, the network card's speed remains unaffected. Hence, it is
> > necessary to initiate a re-negotiation process with the PHY to align
> > the link speeds properly.
>
> Please could you explain a bit more what happens when "the PHY's speed
> changes". Are you suggesting that:
>
> You have a connection where the media side has negotiated 1G speed.
> The gigabit partner is disconnected, so the link goes down, and is then
> replaced by a partner only capable of 100M. The link comes back up at
> 100M, but the network card continues trying to operate at 1G?
>

Hi, Russell, Andrew,

This bug shows up in the following way: when the speed is set to 1000M,
PHY is set up correctly and its status is normal. However, the controller
and PHY don't work well together, causing the controller to fail in
establishing a gigabit connection, which leads to a network disruption.
So, we need to use this bit to check if the controller's status is correct
and reset PHY if necessary.

if (readl(ptr->ioaddr + MAC_CTRL_REG) & (1 << 15) /* PS */)

The troublesome issue is that we have to check this bit in stmmac.
As a result, we are forced to place phy_restart_aneg() there.

Thanks,
Feiyang

> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
