Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457213D7D9F
	for <loongarch@lists.linux.dev>; Tue, 16 Jun 2026 18:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633633; cv=pass; b=pPHZ8DoJSNwO18uU4cO0c0mCdc1AYwuqvXvv8e6NGOfCGP01v4lnoGxHj/rtuvN/kr1VZlOWyJWuDtv5rqlvHjyy6/+K45hpBd1H+PGvgemdoMotqk0Fmna2ex/x5DSwI/7pxdnzRUpQpbuj0FthTof8Cumv0QR84gcyL65HrqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633633; c=relaxed/simple;
	bh=XVDXOs5PD1K5upzQNmkXI9UANSCojiYwT2l1mSGO/eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5m+3upnZp67CKIy+yDCeuXw2WO8DkbzsFF3zZmPG4rOqkZPA232WCjqJueOilzchlOhKbCaWq2djmghhNOOIjplbJUwg4IdwxE3UTpUV8/Iq0OVM30gel4Xxw2xmy2fCvSqpCnJJEiXwkiCjWM7gOJZFJ7CwFGUMYSOUnyeb/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcg2AGUX; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcg2AGUX"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-660323f7b27so4782273d50.3
        for <loongarch@lists.linux.dev>; Tue, 16 Jun 2026 11:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781633631; cv=none;
        d=google.com; s=arc-20240605;
        b=AoBolDJi0hiL8ZzlrjEAcQn4DNhaObZr+27SSbBWhDBEIZLNf/VjyMSC7mDoZPItkZ
         RHVRwPYkR+Zad0p7BvJqEf+msraO+s2YZdSyoYSLYUCPdK+6zcypIof9wgwkxtX3gPC6
         j17VCh3C++yEnWFFFkX0MQRFEeEYgd19uvEp+ZgeMsdfJg+8fHyz6/Xtuxp5pxNW9UhP
         grQ8BBL6iWiPZBXlXd5H9VNg2pjP/imFfdbBqLkRmHavwXglxPpzR5Fjfvt5r7UWBEXn
         QU0OvAK3rtZje44HsjA5v27ugc7Xblo0mE3IQ1sO58TKK3FNus5SyQ+W4Bb4yO7GZagU
         4ZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        fh=hG4l8VZymEn/uwFjToGclXq/N9Jq7Vm54Am/cSs3QK4=;
        b=Pjm3hZbwLNbK7IWa5doSpIe5a6VZhu7AprUPT1ZYet0/ydxrAP8G/nnzlQMwOwKhPu
         Ca0zrYk1U1VWXWjE1DshLgdeGRfj33rpkJP/L7DTHJ71mfnJ6+YhdFRjjXlblpuBPB5f
         NxlB4otHIDbPva/hCOdwBvk+ieztEyz9soPilON/JXqJD1r0wD4EHJxPkAw/jR0sRhg3
         e41KfR8I1MFLRLbBg5wYlBThJnCWTjdacgYUcnPCTfnLY2zx4C7/dr/Xm37VCoKa5kn0
         TeEH1JtwE5zQUWExAnhEhsvwBAD73jIF3ObRaE15PGVn39RBYpDjdZRWzPPyJ09lvciD
         u/3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781633631; x=1782238431; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        b=jcg2AGUX9pLvhA1la0w5lKTpd29ykXdV6xtNFCcPJTJlvXLtKj641aYVQooLdWQZSt
         0pzBJzIrxdcFBKft8Ehzkjab4VCf/qDzn50cdZJOZwRkkGCys3iUMkkfAh7/afkt1tl2
         BNnxmdEVzZe6GiWZJqrBjGZfVpUiPrK4axLi5nIxJ40u4P7dUi0DUc4JNU7DhS+210c5
         SdD05e48ryDgqlisxB+q0rGQz6NQ248q7jEr1gRI8QErB0RpCwPMuSpKNHGqWXz/YsNb
         8AOoHd6SBGiv+YtxjVxP/I2aXCnM9W6piItnicHUYPQPTvueruXF4XzL/aI97Z4GNEJ6
         DDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633631; x=1782238431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        b=Lr1sLt4Oh3tSrqxemvWOLyTOQPXmGxZ8yuN44Wvpt/kjRJPlhOmkVk5cdlr0ycqmxR
         QPR6soZ+Ae5DulrryOFDO6ghGS9okJTBUd9Q11u7maaP1YdH+jPL2+6psejhjxWAm/yF
         bap9thJjtVQqkyeygfq/r7Sy9iR7R13Ky2GtduJyAc1ixQlk56igkbydJQnC75af5wFe
         +GmyOY9gSIGar8MqKY/ibnjmR+yL3x2gVSJNW5CEOhsfAnkfh87T5A8QRaF53Ol3dZ64
         UBypPb3Jb1+i+aIepfM7MXAsQTRR9xReVuZEzOpSoKYR7ioC+U9CzqkltoUQ0i5uwlNB
         BJIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9R2OqC9nHzEOGkogIt9roaXRkZBJVK+CthxtOx6mEVo90DSpYN+ElA+cMpk7VBqDWKdvWQPBbsIAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YywGpQSVSp0gsrtmXVX3jqvv/KEXydpjflytRpIqBgKt4EdWbvu
	L51H+huxN/RQ0pE1+JeJdVq/6QOHeYQOpyEZ+t8M1kxM/VHUMJ86qAUYLE3T9R7ORqXkq8Ydkbk
	UhTMJBf5+hAT6tAuOFs/OKa/QrDz1JWQ=
X-Gm-Gg: AfdE7ck7o2RIY9lnoi7kwle62uXbgrMHxUSC9Wkl9cwcu9ZkQW21VtvExy7kbr5D+Ra
	0+DVyg2CtIMlbRaYnut7YBxGy/fJ2MbTfVeg7G6PZpr5+QqUfhzCyyvr7Ldl2k3YTzhToMwGRua
	NKbjHBiP+YlxsCNbdASaABGe8QKJYmsKvpfQwBXr1eapmwdsIpdB/YPnmXKbIOqQN8Z30zdo/Ju
	uPlRINmW/gFp1rbVckH06M3eHMbsMr2r+6xAPh5zZEhY/m61qHSCicMx8XUgwTMVGMrbLXqjFry
	+leb
X-Received: by 2002:a05:690e:1446:b0:662:b875:b149 with SMTP id
 956f58d0204a3-662cb9a5521mr488948d50.28.1781633631026; Tue, 16 Jun 2026
 11:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
 <20260614161503.2219681-2-ekffu200098@gmail.com> <20260616131945.GA2236977-robh@kernel.org>
In-Reply-To: <20260616131945.GA2236977-robh@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 17 Jun 2026 03:13:38 +0900
X-Gm-Features: AVVi8CfDQJdb4Q9jLQYUPY3KXB7WpMZ-iKjsv1-5FCLStEz_WwunrIBu4QHvpOQ
Message-ID: <CABFDxMGYTP4uLaH-ew+zf4++CtPY54+pDsRVO6TbC9W5nVVtBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] of/fdt: fix misleading elfcorehdr reservation success message
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	devicetree@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 10:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Jun 15, 2026 at 01:15:01AM +0900, Sang-Heon Jeon wrote:
> > fdt_reserve_elfcorehdr() does not check the return value of
> > memblock_reserve(), so a success message is falsely printed when the
> > reservation fails.
> >
> > Check the return value and warn on failure instead.
> >
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  drivers/of/fdt.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 26f66046cc32..d985c07d7c5c 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -479,7 +479,10 @@ static void __init fdt_reserve_elfcorehdr(void)
> >               return;
> >       }
> >
> > -     memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> > +     if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
> > +             pr_warn("Failed to reserve memory for elfcorehdr\n");
>
> I would think memblock_reserve() should always succeed and if not it
> should print a message rather than having every caller print a message.

Thanks for reviewing, Rob.

You're right. After taking a closer look, memblock_reserve() either
succeeds or panics before memblock_allow_resize() called.
So the check that I added in this patchset is totally unreachable.

Please drop this patchset. I'll be more careful when sending patches next t=
ime.

> Rob

Best Regards,
Sang-Heon Jeon
