Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259734;
	b=OYrklzE0Aa7xGgBBhlKHwWy+sQuntm77CAPBhVIAQQuPwvEcLj2QVMfpbdgtL/oIpR+W
	 FFPwPX9Ddo7eLWVYWInYXY1/SsJyIKkFkqkLKgSRYzWwyEYUfmGw80HKrt7UUOM4KUY9O
	 p3YxpO1xaUrFdRDrMGKCl8qAznZp1dh0CaJKiO98j/JKbG4rYf7mePq6XwsD5oXGijGoq
	 Ts1KHaOulu+One17gqQdCeHi7u/5kMaBHSj46g76KR7PCvuLTxmBxZuERjdAoAspoqWTO
	 AHVYo9qnByp8tySMw/22IkQi0tl0b11J+Eqt73awUCpJs3X254bDnNyhgkVpMLbIPwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
	b=z0QsPbIcf9CNToC26sX1Zy+G1vP4ZW2gRPuL3mKooUKWi0s09L/ha/42zozRKC7BHLaf
	 Y/7yqc+n2hICWBDOUj/4wqp64ivkD8uGsiD1wrEUIVg6jkHHbAxQObLGqnC8laQKrtSwe
	 Kfx5RNlfGhFefNdPNPZZyR6+KrbEr217/IkNSDcrh6LTCsbvkCvAp1LPTxeVtgBJUYqmO
	 eU5Nye7Yl7F20s99Fbmqht9Ugbrs5ZLmLJMGDR3XuZ448VUJPNTIqRVaEoaeknKY4qrUE
	 5m/EAH+3ITAa44N98lNgCtKTJubEHM5zgfFseAm4LmLQ7vKPJ7ceb1IGMu7olBUC+qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvNhMib0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7B7606A31A
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 07:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvNhMib0
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c468bd799ecso234285566b.1
        for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 00:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793259732; cv=none;
        d=google.com; s=arc-20260327;
        b=LcLmXhNlqRVu0VkjPDenhAAFxUvEFESic/1jSyJOijT9GqHfBZIiD7WBVFhU057byk
         YBMMvQjedjihruOzlZb0T5BwmVCtceQWe24TxKSxzoRVVjvpDO+kDP2JLpC/qaux2x0p
         E7OzcEdBedSGEqW1R4gXI3KLTSzy4qB2TaW3viI6PxYDbauvlDh4wQ0OMnKiiQkyDd8e
         qBkSkLC278yi9c0n2RDXWnuHi9rQ9yHvLHLbp0WsM/V+KY+EPNrdBo5A5CefWWHTD9NU
         za67x6A2ZPFyx993T8CsNc5k2vN51n6has+Xjh9wKttsHv7l0ikqJT3C25tF7GqADlQ6
         00bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        fh=HHVWOhc6uOGkJAlSlZJcVnIZ03XtpQ3pgxH8MW943P0=;
        b=InmgWMlLbIjp2JDiy52A4qFHP/sDjYGgwQsEtanbFqv12BJuRKC8bh9lFSpQjzU2GX
         fwz8AFDDNAN8JaM5XNN+V0rl+84W7KHrceifE4Xat7yOqFM+R62HHeF4dpEEdPFp44fN
         2sWJr+vSqDR3Cxq2I+8eBbAne0A2fKHWA0h1w1WD5o93GaypIpwNg7Z9N+w+5SY0QZVY
         9E5+wKtB6c+0X7qxKdFt/iEgM/8GGeg+6p7p9NmIwWVWgxFXzPHNLRwjAObub9CgtswQ
         5SnBzLEEYV3fE0Vdw4Rt2Wl/Q6RSsW3VW4IBvMweWcsAdM7gn6SnY7hviEmhAF0AGnhS
         gZ6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259732; x=1793864532; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        b=rvNhMib0wTmSjPI68zftzxkVXnjTr5fW/urS6k4XDag3tkaTQ3gMwfXCre28VbjB7b
         LVprTEgVdCl/cpTDQf8P1sbUBMSf8VTQ7a292BOLB2DNL3aF+EZsqHyTtCJPNdcEMNKX
         xrMrJn1WvpM8hGa69854AcLx/lIV1pKcDuaeRboP0flxR0b3L0poQb32zv02EKYHt2/x
         5oageYZUAA2LOo15pGG7VvTLp1jeglVo2An2ruo0z0F8pMLn4cW6ADMzjs1+Ip3APstF
         RqDBrCnt2mwTzv3fWyyrHZiIMxFORl1cf7I8yxXgrbKP8dL1al7g31a3gd9YPdPazP5v
         dHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259732; x=1793864532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRUCr4NQ66GLUUzHJ4QDNjrj6aEkhbXAp6tE51ISY0s=;
        b=XP1+k1MqYBU36i4cNgvCCCSwEclWCrR1HcL5QXFvZtD5TwnAEe8p3rrUNY0FmQzoMk
         XeOXWmQ/h7icq47mIR5uShYTKbXbpDKcFdtLH9O34xw895tg8gKFe0TwSz3qcg54lILB
         xGytANm1M/dFGaWcO8qzKOGHlGa+8DmOPuz63ekMWNuvQ+Jq7bzcknPe4MS4+q6Kmcvd
         6PwfPMPeZ3eGrZg4pTUyUMeUPnNYXYopMh7iHxSM5lCf6PKRYWw4OzircjX7HJkwjpVk
         4HZXaA5qh/PGRo7H7L6hipklZLyTrNoJ3P+Pu8yZx5IxIkxYn7z9OYrthaBXHcLEUBZC
         SucA==
X-Forwarded-Encrypted: i=1; AKwUvByYDJYVfw91XaXTZc7+05yuFwx1lJzciT7PDuczdQQ/BDxLWIpRvGdWXeo9CgT7apZd2d5uwJgsJwo=@lists.linux.dev
X-Gm-Message-State: AFq9FYKxF42RDyrVDN94BtnA4RoEQRQLtj0LZkFWTwguYfY7oYztxtXL
	u1gVJAVq1IL2uIiV2GaRztnkmeKyb04705UQ+AP4KFwqO2u0Z6Q5bZxpWzGi6rEhqlDCrDJXBFe
	nJ7MAAius7Ue+EqnGa/22mi5vLP4Ng2o=
X-Gm-Gg: AYBFou1EBg40W2w6ymYtaoaZ1iAEKhL6IVsbF1qLIey1ehjfnQ8IWKnD2aiXeh62074
	5NVNew5Rq4LtBj1ZxrgNyCXz+6yvhgUmL6XRDNGE63u3cCphv35K6J4x96lqakTud6VPptEp4vj
	JSwUWj38Ow8V9wxwh6JZuoMd5vX0SKQz1wyXUKDBjWc6aFy7NQ5PsojiWlN/pHGfeFwJcKkhQOg
	e5BR2oXqJEPzQdUhW57LrykUmHyJcqKArpCRYs2h4VINeBKuT5nT4KsT2fNpUokoJI1DM+/rJtu
	W0uKNzYcasjpDMCaGQ0/drWADsiE6lGU6yJm+xY1khkKmN+yhR5lBmN03EqGdcveecBtC85pZNn
	YOo2aOxfjwW6W13lOtrSjUm/QGGpRBFJJd92Kkt0=
X-Received: by 2002:a17:906:fd45:b0:c49:bf6a:28fa with SMTP id
 a640c23a62f3a-c49bf6a2c46mr282671766b.28.1793259730604; Thu, 29 Oct 2026
 00:42:10 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1792988985.git.zhoubinbin@loongson.cn> <dcb49d67055cc41af3bd68cce01c05e73a7c2787.1792988985.git.zhoubinbin@loongson.cn>
 <auIe15pAb8ZZWbnV@lizhi-Precision-Tower-5810>
In-Reply-To: <auIe15pAb8ZZWbnV@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 29 Oct 2026 15:41:57 +0800
X-Gm-Features: AclHuK8kbVDGgdNrbovyTyakUo3h504IwuEClXkjkVVljd7312xDrPpt32lzyXs
Message-ID: <CAMpQs4KMbvRpF9axnnEbO6Rcna77WqHQykv4jvw-EOnSbH8FBw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dmaengine: loongson: loongson2-apb-cmc-dma: Program
 CNDTR when advancing sg
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Thu, Oct 29, 2026 at 12:12=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Mon, Oct 26, 2026 at 12:31:22PM +0800, Binbin Zhou wrote:
> > When configure_next_sg() moves to the next scatterlist entry it updates
> > CMAR but leaves CNDTR at the value left over from the previous entry.
> > The controller therefore keeps using a stale transfer count, so the
> > hardware does not move the amount of data the descriptor describes.
>
> How it works at 1c0028e725f1? not test ?

Let me clarify how I found this and what I actually tested, since
there is a fair concern the patch may be redundant.

I hit this while debugging a CAN-FD driver. Reading through the
Loongson CMC driver I noticed that loongson2_cmc_dma_start_transfer()
programs both CMAR and CNDTR for an SG entry, but
loongson2_cmc_dma_configure_next_sg() programs only CMAR. The
asymmetry looked wrong, and I wanted configure_next_sg() to program
the same set of registers as start_transfer().

I instrumented the driver to read back CNDTR before and after
configure_next_sg(), and forced a non-uniform descriptor by
temporarily making period 0 shorter than the rest. With the CNDTR
write in configure_next_sg() reverted, the read-back stayed at the
period 0 length for every subsequent period, and the TC interval
matched that length =E2=80=94 so the hardware was reusing the first period'=
s
count. With the write restored, the read-back tracked each period's
actual length.

That test required a non-uniform descriptor that I built by hacking
prep_dma_cyclic(). As you know, cyclic mode itself is uniform by
construction =E2=80=94 buf_len % period_len is checked, and every
sg_req[i].len is set to period_len. So in any real cyclic user today,
the hardware CNDTR preload mechanism already reloads the correct value
on each CCR.EN edge, and this patch changes nothing. I2S audio works
fine without it, and I could not have found the bug from userspace
alone.

So yes, this patch is arguably redundant for the current in-tree
users. I kept it because it makes configure_next_sg() consistent with
start_transfer() and removes a hidden "all SG entries are equal
length" assumption, also I'm happy to drop it.

>
> Frank
>
> >
> > Program CNDTR together with CMAR so software and hardware progress stay
> > in sync.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson =
Multi-Channel DMA controller")
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma=
/loongson/loongson2-apb-cmc-dma.c
> > index 8b8d530d60c3..c654e0572902 100644
> > --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > @@ -266,6 +266,7 @@ static void loongson2_cmc_dma_configure_next_sg(str=
uct loongson2_cmc_dma_chan *l
> >
> >       sg_req =3D &lchan->desc->sg_req[lchan->next_sg];
> >       loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CMAR, id, sg_req-=
>chan_reg.cmar);
> > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CNDTR, id, sg_req=
->chan_reg.cndtr);
> >
> >       /* Start transition */
> >       ccr |=3D LOONGSON2_CMCDMA_CCR_EN;
> > --
> > 2.52.0
> >


--=20
Thanks.
Binbin
