Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08E2190485
	for <loongarch@lists.linux.dev>; Tue, 20 Aug 2024 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724161818; cv=none; b=RbVb8N7Khz2gO/qeQHCaPIljBReS6H6w/939kVVeW/sGlHbOyslX5a+JjPuskVEGkRJPQF9k8B/bp6hcH64k3Ngwb9LkHgvw7Lm+LFYsSNk4GiyCZK9dgSVYwNmhGvaxCYybgs0SnN1/RfKV4MNXDDPixjh0dZg0Y/sUlJpoTnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724161818; c=relaxed/simple;
	bh=D/X4XfUDRu4pM97jVQKqcprGLaf/V7OIPiK0II4YXMI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DHB4cDYpvUdW2Op7onEYPxolHLf4vtScUVp0yNR8Y2Y16wWL2F72d1X2O7UMYUVam7ke0IP9H74SQSLRub8XWrgTAVf5CVR95192An084rKvmUj/tkv7dn9bM2Atg8oddx1xIl1++Zo+8Pd+atBUn/lHNv7247xV+ux6ELnLR/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnPkkir+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnPkkir+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d3cc6170eeso996238a91.1
        for <loongarch@lists.linux.dev>; Tue, 20 Aug 2024 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724161816; x=1724766616; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDFUnkSGjaQxypInF07Poa3P+t0Ku2ZifidG1G95HSs=;
        b=ZnPkkir+RxS0pE268K+K3FWJ3ypjlTjNrofwhlMqIiUB6yqKu/1JYKMq0Ybqaylf5S
         oNoMMefHIWZmGugYm5Gjox2oKudecOpJshBbiJDqM50ubGV7XMxm7jUHFycnoqRiNw+u
         vUHMkugdcyMYCvwcvEeF07FeMYqDUJIa9CQb8wdmMwrGqlpvFlAgRuLKgYKxkaPX2oGc
         jkOgfP4uoX9t/YfG3Dgz8cL/Qx7wAF+qjgnsupPz3sZAnXcQOGmAjx4gj3jgoDlGmwe8
         VD0RCPTysB45ek4Msd9ndT0W55jyBCWred3o2WqNjd+D1QDDoRgtTsvQGOOgDSlSk0Gz
         tVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724161816; x=1724766616;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDFUnkSGjaQxypInF07Poa3P+t0Ku2ZifidG1G95HSs=;
        b=JkXt32+28JhQquFTat086LrODbqADTQ87K4zw5DOQAmFgn63wyPxdveMTsC5bIg4Vd
         FOy+3+Ldnb7h2gbN/O/7oeJ5boKn70fMV9uBaSzZqxFHLLfUU5AkVBVRb7vTtpMHsYUt
         p4+VgoIiRsxfua0vQ5ZOeRJcSzbid2BWUHSZKNEZ3ofU4Xx7QqZXPADnvsf+ZDxlM0+X
         g4wa19TQNS0VV55WuqkTx36J22iJAv+XD8IL5Kn/V6k2xsW6AS5OgNCLJccK3pGZt4IB
         6PXdau5Fuq5HT2fDURZFopghsZzBajcDLDJJ6NOkGxpm8h8wV3ZIfKChqQZqjURC4jy6
         dzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTCeztnJsnBzlLEe2bGtMmxkmU3LRDFjG32TzDKAIUqvFwfk6uuhOm3bF/nFkCmNQIV1GNBZSRdY8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkTNzbd90xHIsi33BON3z3XYiBSGe+TQ1qXKH7k3cKYAwsAaNe
	bmMKztw7KFNgpdYXQBJ66v9+u9nAFPsM4ohO60MBV87CcwYNom6c
X-Google-Smtp-Source: AGHT+IFLzq41ciIqlNHU7CfX0QhrF4T6k5OQj11ipYz8epgs5XTfHhFbR5O91RrTCe/bSDwsUUgQ0g==
X-Received: by 2002:a05:6a21:998d:b0:1c4:a742:ab20 with SMTP id adf61e73a8af0-1c904db932fmr8719157637.0.1724161816075;
        Tue, 20 Aug 2024 06:50:16 -0700 (PDT)
Received: from smtpclient.apple (va133-130-115-230-f.a04e.g.tyo1.static.cnode.io. [2400:8500:1301:747:a133:130:115:230f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae06bb7sm8242227b3a.58.2024.08.20.06.50.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 06:50:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: It is correct to introduce new sys calls to stable versions?
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <2024082057-coherence-lethargy-3513@gregkh>
Date: Tue, 20 Aug 2024 21:49:59 +0800
Cc: Xi Ruoyao <xry111@xry111.site>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Sasha Levin <sashal@kernel.org>,
 stable@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>,
 linux-api@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D19DB99F-B5D9-49A6-BCF8-A5980A9BC1A0@gmail.com>
References: <DF762B6F-360A-4C0C-8C85-55686417209B@gmail.com>
 <2024082057-coherence-lethargy-3513@gregkh>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3776.700.51)

Hi,

> 2024=E5=B9=B48=E6=9C=8820=E6=97=A5 21:36=EF=BC=8CGreg Kroah-Hartman =
<gregkh@linuxfoundation.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Aug 20, 2024 at 09:19:04PM +0800, Miao Wang wrote:
>> Hi, Greg
>>=20
>> I saw you have included commit 7697a0fe0154 ("LoongArch: Define
>> __ARCH_WANT_NEW_STAT in unistd.h") in your stable trees, which
>> actually introduced new sys calls newfstatat and fstat to Loongarch.
>=20
> See the documentation in that commit for why it was done.

Thanks for your explanation. I totally understand the necessity of
re-introducing thees two syscalls. I just wonder whether there is any
limitation on what can be included in to the stable trees. If there
was no limitation, theoretically, I could also maintain a so-called
stable tree by applying all the patches from torvalds' tree, except
those that bumps the version number. Apparently such a "stable" tree
is far from stable.

>=20
>> I wonder if it is correct to add new syscalls, which actually changes
>> the kernel features, in stable releases, as it might confuse =
downstream
>> developers because they may assume the existence of a certain feature
>> after a certain version.
>=20
> Version numbers should never be used to be checked for anything as =
they
> are only a "moment in time" stamp.  They do not reflect features or
> capabilities or anything else.

I agree with you and Cyril on the version numbers, recalling that =
kernels
on RHEL numbered on 3.10 contains various new features.

> Test for functionality if you want to check for something, that's the
> only way it will ever work on all of the variants of different
> "enterprise" kernels.

Thanks again for your quick reply.

>=20
> thanks,
>=20
> greg k-h

