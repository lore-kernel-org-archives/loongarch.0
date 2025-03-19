Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD8C1DF269
	for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742403202; cv=none; b=Ce1bLMGrnEUD4njScSxasljmcNj1abQZS6vkNAV1fETwr0SgHPUVrjra5zprNMN1UP57o6ZDIJwpHVN7J6XmR+wwN6bqaaChyg2VuM52cnv8dNWOq8VSp0pHbbyiHtSumXE4Cn+H9haer8kn5wzh4HIpOsNVqpwZ1q1mgOujp7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742403202; c=relaxed/simple;
	bh=gZ91fGn4VM1jhjIigc/roNld//H+y2pnwO3JvtN5t1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUodD0Xl1HgPJV8Mzfsjcg8nQhUfFORDgk96z/vUIPObp15KlQnomNTw2JkQ8WQF2ojvAM9Ghbf81FNvfoHQgSWO7bGt5xKFv9+5PhSBT8Tu43zW2Ca+RBYZBmX4lK1ZDbWDwhV4016B2ZuHieqWXY4OEV3MD+FzCALQ2wRkVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xa193cTt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xa193cTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742403199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMYidfuF22qqOjt7R1FtIa+eC5SY/DINipfXYLFNQ3c=;
	b=Xa193cTtLwB6J+31fN+oeph9eGd+cvGcGoI+G+Ar3/BTKeEMfllAoXdhCauWJx/0hNdjeC
	AsxsXW8OnEXZALYm8ygHu41vSAkbpowr8HN6t783GZAoNHhyvfea+FcQ4vP2bSV3UfB/ud
	6laHbXx0CZZoJqlD03fh/7el54yTOaI=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-BcQUCrbhMtaLDbCwC3hvCA-1; Wed, 19 Mar 2025 12:53:18 -0400
X-MC-Unique: BcQUCrbhMtaLDbCwC3hvCA-1
X-Mimecast-MFC-AGG-ID: BcQUCrbhMtaLDbCwC3hvCA_1742403197
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-86da817926cso896700241.3
        for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 09:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403197; x=1743007997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMYidfuF22qqOjt7R1FtIa+eC5SY/DINipfXYLFNQ3c=;
        b=qJnqZtuagf7L1Fop/mOSoJ+QiemzoS4M1O/9FihLxttfAG9QQq0Ae2TSXsXfpG05Uq
         AFwAflQXUNMnUeCJE9KOes1e4E3/isHXEn+xfhueEAsZpCyyx/Cucg5BuuvIbkgJy3zA
         pw+ta8Fw6o80RlTlsgwI0LuHm1sIdamzsYhitLFXGPcD0CTMYd01+OViz+aFRcxCyc4N
         pXABtvZKlTEwmxmCivEeCtyz0yTIsP1uUywwa8W9L7SwM0rjjZXWdadVzNn5nHfjifOo
         C3jGQOnsGnbYe5gNBvVN6WB0CmzErQNmibadssWeqSPx0CFRcjoTa7fBobkgcS+CurlA
         /Bfw==
X-Forwarded-Encrypted: i=1; AJvYcCUtLBrlN22b9AuwyDmT0Ez4iLJWzcGuNXM/Hwz6mEMke1Klo0mRTcCpisu4NrpbmvPBeeMY4xawsHg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQgtbfAxEWcw9slnc+Lp7bTHscAyDzdYoEo5+v8FIUgHhnhlrj
	+in+6cVKZOZPCmRcBRaidTSd9yeErVg2m4Whq4cV4f65Z8U1YCSX/3bnjKXPC4p2QQg7/aImioV
	HReATbb+ebKAPNsfeldA1UgLLl0Gcnzi0T6dnIhsQbDTxlYIaluQi2IQJNGC64+j6rDADnY6A7N
	RbcXuYeeQaknLGVmWlHO0MDNxQU3PT+QFS
X-Gm-Gg: ASbGncu7DiNQro/mGPjnYZcoGwUM+1jchXvNgAGRYOajbTaGUK12Yft9x8Y3UHLZaye
	svgMVZYXg5itAHa+jgUfh+z2YjD6xTtig4aGAVuhUSuRVV/HFBWTT9KuclFZxjDdHMs38xbEu
X-Received: by 2002:a05:6102:c04:b0:4bb:d062:455 with SMTP id ada2fe7eead31-4c4ec2f2e0cmr3397551137.0.1742403197620;
        Wed, 19 Mar 2025 09:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBaHItzcn4FKUvbMcp1OcW2oWpcGSy2J17LaT6TvPL1Qm1q4Ep4ILwSlmKbFP+qP7MGksmGbNbt7PDdKxGz40=
X-Received: by 2002:a05:6102:c04:b0:4bb:d062:455 with SMTP id
 ada2fe7eead31-4c4ec2f2e0cmr3397539137.0.1742403197256; Wed, 19 Mar 2025
 09:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn> <2025031943-disparity-dash-cfa3@gregkh>
 <Z9rYQy3l5V5cvW7W@t14s> <2025031942-portside-finite-34a9@gregkh>
In-Reply-To: <2025031942-portside-finite-34a9@gregkh>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 19 Mar 2025 17:53:02 +0100
X-Gm-Features: AQ5f1Jq9puc3zDkRAXP8CifSCOyuo9iakTiG2zcMin5No34Rk7G5vb8HVg7uT8A
Message-ID: <CAASaF6zNsiwUOcSD177aORwfBu4kaq8EKh1XdZkO13kgedcOPA@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, R Nageswara Sastry <rnsastry@linux.ibm.com>, 
	Neal Gompa <neal@gompa.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uRL7Ds_pVS2FvzQ1RCtvejBU1xP-VCFXkXSFybBrjBU_1742403197
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 5:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> > On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
> > > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> > > > From: Jan Stancek <jstancek@redhat.com>
> > > >
> > > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > >
> > > > ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> > > > Distros have started dropping support from headers and in future
> > > > it will likely disappear also from library.
> > > >
> > > > It has been superseded by the PROVIDER API, so use it instead
> > > > for OPENSSL MAJOR >=3D 3.
> > > >
> > > > [1] https://github.com/openssl/openssl/blob/master/README-ENGINES.m=
d
> > > >
> > > > [jarkko: fixed up alignment issues reported by checkpatch.pl --stri=
ct]
> > > >
> > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++---------=
----
> > > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
> > > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > >
> > > This seems to differ from what is upstream by a lot, please document
> > > what you changed from it and why when you resend this series again.
> >
> > Hunks are arranged differently, but code appears to be identical.
> > When I apply the series to v6.6.83 and compare with upstream I get:
>
> If so, why is the diffstat different?  Also why are the hunks arranged
> differently,

He appears to be using "--diff-algorithm=3Dminimal", while you probably
patience or histogram.

$ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 |
grep -A3 -m1 -- "---"
---
 certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
 scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
 2 files changed, 138 insertions(+), 58 deletions(-)

Should be easy to regenerate with different diff-alg for v4.

Regards,
Jan

> that's a hint to me that something went wrong and I can't
> trust the patch at all.
>
> thanks,
>
> greg k-h
>

