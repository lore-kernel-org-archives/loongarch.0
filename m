Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCF7E
	for <loongarch@lists.linux.dev>; Tue, 22 Nov 2022 01:06:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id r12so21398671lfp.1
        for <loongarch@lists.linux.dev>; Mon, 21 Nov 2022 17:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fZneW5pahrcT4T2dDD0v5a/T6rdlQocV9RMRy7IKFtE=;
        b=JctTdb9gNpAwOuK2G6VOtQFDTDqf6WTIK7tUhldDdqQ2XgWXz4UTLvFIuF//u2sHfW
         Zjex56jvWGJD/Ntqp9ViI5vKbL3FqQD47ELCpPgNqKH2rS7XofYnWqsglQ81jCDOzxox
         NlX3aydzi05lZQtdVIQyDIiGPw0uJnfaLVAvnzd8sFzFJsOJmRE7u36LvN9GZADQJig/
         fkO3KGwMsuISJPBI3ebE3qUnKQP54JLJmwcb7e+3PXxAl4Ej9Vi0W1OWMXGaNROfzsiZ
         rx1GucYTNaUs5n+omSLB9HZF33d0w0nc5LaN8uRovj2QniTH3m25B6dfpDDcqHUY+OL0
         UHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZneW5pahrcT4T2dDD0v5a/T6rdlQocV9RMRy7IKFtE=;
        b=TQRhQWwivnyVsP6QSlOQe3DwbPz1YrINCiKFQD4RAe9vjL/QsJwSCa607B0W6NYrz/
         CQ+lcJ6Ib4eJsptyByTihGMu6jukGI6RxcEXmb/HVvJgL1BO5i8RQ+GgoW/lz+aD9fzA
         1WIvVIQRwWJp4ninTHWn+HrULRpjSUa5rVkOkFpWLEfCXOr/A+cJQBOMiekw18ixhC0L
         gnTNn0U0fT1Efq08oCPPKtBsmPEh5PZtVqRa4JtoRVAJmZCYxJmWy2lfwCmWPluU98x/
         +qapbM63poIyhbuxrWHy1ON98XRRv9jpWKeZkrwO5Hlscl8VKqylDdlzkyLXpjCRoi7N
         TFFQ==
X-Gm-Message-State: ANoB5pkN0FwoEOVs0QnBwcxyhXgAdNIZBgkLgYZQlPSRF65kYGLXBrwc
	z4ArKu9+L4XofW/5D2Ghz+u/rsSGorA2OumHams=
X-Google-Smtp-Source: AA0mqf5lfMMCVPgxdv8MwrAnTWfDwW42blHF1xkxuBq3Bcqx2Ls5OUaiEBQKXfoLntX8qQ+Ijh7KYRYwTZYi3HkypCo=
X-Received: by 2002:ac2:48ad:0:b0:4af:a599:f058 with SMTP id
 u13-20020ac248ad000000b004afa599f058mr6532942lfg.49.1669079195284; Mon, 21
 Nov 2022 17:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816102537.33986-1-chenfeiyang@loongson.cn>
 <Yv2hlkIpd8A66+iP@lunn.ch> <CACWXhK=YF+z0wofjDAo7XW8cSV2NZgHpAK3u5=rkvvKTd8MjFQ@mail.gmail.com>
 <16d361992b707848c0b0258ad1d0e4c3958155e7.camel@xry111.site>
In-Reply-To: <16d361992b707848c0b0258ad1d0e4c3958155e7.camel@xry111.site>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Tue, 22 Nov 2022 09:06:23 +0800
Message-ID: <CACWXhK=M7E52aZevK_CZFdsoLrKm071LWtnoyBrFu8-9Wc5B8w@mail.gmail.com>
Subject: Re: [PATCH] stmmac: pci: Add LS7A support for dwmac-loongson
To: Xi Ruoyao <xry111@xry111.site>
Cc: Andrew Lunn <andrew@lunn.ch>, peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, 
	joabreu@synopsys.com, Feiyang Chen <chenfeiyang@loongson.cn>, zhangqing@loongson.cn, 
	Huacai Chen <chenhuacai@loongson.cn>, netdev@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Nov 2022 at 21:03, Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Thu, 2022-08-18 at 13:01 +0800, Feiyang Chen wrote:
> > On Thu, 18 Aug 2022 at 10:19, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > On Tue, Aug 16, 2022 at 06:25:37PM +0800, Feiyang Chen wrote:
> > > > Current dwmac-loongson only support LS2K in the "probed with PCI
> > > > and
> > > > configured with DT" manner. We add LS7A support on which the
> > > > devices
> > > > are fully PCI (non-DT).
> > >
> > > Please could you break this patch up into a number of smaller
> > > patches. It is very hard to follow what you are changing here.
> > >
> > > Ideally you want lots of small patches, each with a good commit
> > > message, which are obviously correct.
> > >
> >
> > Hi, Andrew,
> >
> > OK, I will have a try.
>
> Any progress on the refactoring? :)
>

WIP :)

> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
