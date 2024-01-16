Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CFA2137E
	for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705436420; cv=none; b=d7wu93Vey+n6gmIpYvsglPf1QcDpjlgFy7flEOF6CSSgSYXI/Jz36UC5jZS0EouWLDnr2BojztycE1HMHSnpPlOKnBKD9wQiXPShqZCdrDSbfXvUZ4gyaNN0dQ9zb2mUnVwhL1T8af0/jhDIiEWZppllpvvGAsr5+tqPEcyvRrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705436420; c=relaxed/simple;
	bh=ypMdh/++OwkvopOli42ESwH03tOw7T6GPLwHwKrT31E=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=NhHWBpe3CWgVlOMUDqM0zsbYP+nqs3VLVnemS9X1Ico/PNhd5g8G1IbrjDhYkLCF/jVAToNPm+TvnbQLvzQkgrrdbhb3raYGjDYt9FaOsbyQ7zG+fwKKMyakCOKXXi+SEfF4UQ0XaRkWuBW+Rclq8AT9OY+4WFX3gi8cnHX+koo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bip81dPp; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bip81dPp"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-559c6b833b0so626146a12.1
        for <loongarch@lists.linux.dev>; Tue, 16 Jan 2024 12:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705436417; x=1706041217; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3E2Y2gGlsfMwMpgThK3AbQt/GlaabuQMTiIlyvqmJY=;
        b=bip81dPpSwEA1Dmg/PEA4Ler1ID19ImfQtInucXuDMVVmxz3fYOdy0fxsSLV4jmKGb
         k/ee2iqzaYckQ2t71/4F+ONn5wOI24WBrrG1x5rwqrW5diQml4fnDUKLe0FhoRnyrOgH
         fYnbI+GKdW5D7HeP4aH0OGXehuNYfbkJapRUXAjK3sNUV90LVuf6M1rDql2Ns72g9kDA
         NBL3vXRH3r2uB/mWXLvbyoXlkf+AGvCi5+31mu7OtN15P3JO6YZfFI/11m1xHB0SOOya
         t4SsWT09awo4pEeYmbz2irtQGzhRsefykBuQwSpxUMdGLoKG78UsZtSdSwImYthraOH5
         G25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705436417; x=1706041217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3E2Y2gGlsfMwMpgThK3AbQt/GlaabuQMTiIlyvqmJY=;
        b=DJuBECu3s6NCwYZIJgGiEweLtP9Gu8IzQgA2suUfK2fOITN5daqfqDxMdOj+sI4MoA
         sA1P8WC6oqkm10SjW/LN/Lzxp1phQY00dJwuTIHTCQv1K7R/2vizTBPXV5zIX7q16wLh
         G5hcWcgj9vF9hyKf/b7VdOBljyLzxWVVCek0c+zD8fvm3FZlpXLEgpO4rHFxmYbwGb6/
         kJMiXr44PQnLs+QGVcAplCKluuoAwri5udOoAc4coY4bmKzHB65UtTjNE+7Moy1lwSnD
         v6tUmNm/Vghw2rD32ehHqy8+EGohBxdvyPqBMWLavHe/Puz9xgvKskS76OOe5XjIF1Om
         PQLg==
X-Gm-Message-State: AOJu0YxHQWx6X5dy+QoCmyJdJ03cGUfDTGP/9VR+kxw5BDsCOJKGVRax
	UNE/QLVI4601xQabyfTOEJ4b7XTGRsrPYb+N7cCZA+qpgnVn
X-Google-Smtp-Source: AGHT+IEPFQwqltvYgFxlysBjGHd+0u+L4kfWHJuGtRT3TShDlHV6JS9iDCNOLsEInB40YpGF+P8XDD4PBoRyi2p/qPg=
X-Received: by 2002:a17:906:1457:b0:a27:915e:a306 with SMTP id
 q23-20020a170906145700b00a27915ea306mr3648666ejc.136.1705436417121; Tue, 16
 Jan 2024 12:20:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com> <ZaajDheNtqKkCoeD@infradead.org>
In-Reply-To: <ZaajDheNtqKkCoeD@infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 16 Jan 2024 12:19:39 -0800
Message-ID: <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Christoph Hellwig <hch@infradead.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, 
	WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Chris Li <chrisl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 7:39=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Jan 12, 2024 at 04:38:30PM -0800, Nhat Pham wrote:
> > >
> > > I thought deprecating z3fold is the low hanging fruit. Then, once we
> > > can sort out the MMU dependency in zsmalloc, we can go after zbud as
> > > well.
> >
> > Makes sense to me. Should we do the same thing to zbud? We probably
> > have even less of a case for it, no?
>
> Is there any user visible effect of switching the allocator?  If not it
> seems a bit pointless to deprecate them vs just removing them (or maybe
> making z3fold depend on !MMU for now).

Well, better compression ratios for one :)

I think a long time ago there were complaints that zsmalloc had higher
latency than zbud/z3fold, but since then a lot of things have changed
(including nice compaction optimization from Sergey, and compaction
was one of the main factors AFAICT). Also, recent experiments that
Chris Li conducted showed that (at least in our setup), the
decompression is only a small part of the fault latency with zswap
(i.e. not the main factor) -- so I am not sure if it actually matters
in practice.

That said, I have not conducted any experiments personally with z3fold
or zbud, which is why I proposed the conservative approach of marking
as deprecated first. However, if others believe this is unnecessary I
am fine with removal as well. Whatever we agree on is fine by me.
