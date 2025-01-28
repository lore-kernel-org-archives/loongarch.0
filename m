Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B0D1A0712
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080287; cv=none; b=es8QS+y9GzufWh0bXu78bKjSZ9HqOkZmZlmzETkC8f1JabP3zPUjDTyHT4oXBUrV56k7HT95Un0FtjayonTqllBdbPvDuMvYkonxPquFF3ACwbNNoDm4RkP0l8baIDrX6xW8g4qEpz191xL4XLDHiPAanP4nQ9yofJMrN52FvAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080287; c=relaxed/simple;
	bh=RhniZbcJoRBwDM8m9CKksXafBIe24ETY3Yyt3VC9sG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCtUXb/DRAW5tq2cQtaSbIf1Nlc1NL6kb/o1XwVd/Mzber9KN8k5F1dn533D4wyWjWrSXo4o97u04tuJobI59hrTWPaxU3WaiYkC6bfWKYgRoveakCDIVDMEixY9eS19BpG8f8bP5GjSSSs2JKbrJdm5vX45S+cx2xdhkrd4GxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJ5QVLP3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJ5QVLP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738080284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oK3AMqO8H7ZclTe1BgMukCS1J0g89sEEML8wYhEGJSM=;
	b=BJ5QVLP3wZQ06g3a7AuTnGlQymu38jLAoWwTTCfJ45EXvtpIi/C6JgJo9MK7UmEHp/4eRU
	Yu1SnePxqNFU/zxdCwvj+EksJhfrQu1khVFtYKiNywUtCJihtCzZYInYRonakEhOn0Gm7e
	9Ebg27TM3+Mt0L1oKrv7OKzzYZXWfJ8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-j_72RDYFOva7gwzxJWoZcQ-1; Tue, 28 Jan 2025 11:04:42 -0500
X-MC-Unique: j_72RDYFOva7gwzxJWoZcQ-1
X-Mimecast-MFC-AGG-ID: j_72RDYFOva7gwzxJWoZcQ
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e549c458692so15042337276.2
        for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 08:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738080279; x=1738685079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK3AMqO8H7ZclTe1BgMukCS1J0g89sEEML8wYhEGJSM=;
        b=dyPQslWCLO6jjopR9Fgtdb7Dfv1/rDEoifod3L8wR64NmWNMa3gOHu571/VvyqxMdW
         ItmPLIg+gvvLOf5SRAK4Na0leMjphM3wf8Adsx+Yg1+WxW8tPRbpN/dJqXRgal35FRo7
         GBb83fQJhlAVX5rOC2I54aziH6zPWiaCxdD79GG0kaZ8yUYdVi8cBGj5LrErm0TYhfrw
         eXgN10a6ApK02QNiquWqF458xwTuybCelUvn6zI+jbKRTjyVlwlUQ0QQeI+5lQGbfi9F
         5yT5yAFkiMAreEv5B5+xu2YYDYFgK3QbE5bS3CbRgYAMTseVp33Bdv8nyLkvqHvhnls/
         0UBg==
X-Forwarded-Encrypted: i=1; AJvYcCVte0zA/RlV9zU3zMxyDk8Tqz0sQ0jUBkOLL89fwJpAV85vwQJA7E8lzKLTA7egLZx2URs2gzEyMgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZYspT2DRGRsN78LufibMRgVz2G41Ci4F7rO8Cb9SlaEsHScVq
	f4Mo8+dOAm0FRoAnp/3jjiUEXWUhlFCmnjzlWr/Q+Lch7rqIaaRGf/c3kypqjrexgP3esk4mKYl
	/3MbT08wwvB5VdQWAV0Q5N7n+WZLSQ7oR2l+slYjXk4KOfBluJAqn8EbHGX6IZ2WGRxQ6jCMv7N
	c60KXWMc7dMrdcqRtmiICjK0PtsO3AIQTC
X-Gm-Gg: ASbGnctj9N7E+IetSWq2Gk6hQUnqRU4AH6SF0CzaSEjm8aFt0wEC4wifkFq9a/Jc19M
	CBmLk40aHjYywHKs6KuNPHmC5XUMsGbUySUlVc69UmcqNQIGXmada4CO5pEymlqqZpx+VMfOKSJ
	GD222ELuwKp8o+JZ6Y1Oc=
X-Received: by 2002:a05:6902:1206:b0:e58:11f6:db7b with SMTP id 3f1490d57ef6-e5811f6ec07mr20583426276.30.1738080279024;
        Tue, 28 Jan 2025 08:04:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqpPnsJFhxc42G1oeTcfqfAOFZmnXdusw+cHU7YmKoq+g3Kpg3lgQxvv7/0FFeXlJcUOiULKp35Dm+RVVOMDY=
X-Received: by 2002:a05:6902:1206:b0:e58:11f6:db7b with SMTP id
 3f1490d57ef6-e5811f6ec07mr20583386276.30.1738080278672; Tue, 28 Jan 2025
 08:04:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z5gdnSX5Lv-nfjQL@google.com> <42b24914-719a-4ff1-9d77-f6517717344f@suse.cz>
 <Z5j4HrzbT2sEOIqn@google.com>
In-Reply-To: <Z5j4HrzbT2sEOIqn@google.com>
From: Seth Jennings <sjenning@redhat.com>
Date: Tue, 28 Jan 2025 10:04:27 -0600
X-Gm-Features: AWEUYZnK3ZHmW0BZFQQNIfrlt1GZ0ue7jpu1rb49U_i_mAa2mPxwtfiWv2J99-g
Message-ID: <CAC8qmcDZ8DeXEX23N0Xscjg_wR6HKL=AVE_5Y+68gCeLzv4bEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Vitaly Wool <vitaly.wool@konsulko.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Dan Streetman <ddstreet@ieee.org>, WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fxzmx-0E-7jvdWKf0XSnnpi8B4KHj5QAc7tHc_TkNvY_1738080279
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 9:37=E2=80=AFAM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> On Tue, Jan 28, 2025 at 11:21:10AM +0100, Vlastimil Babka wrote:
> > On 1/28/25 00:58, Yosry Ahmed wrote:
> > > The zbud compressed pages allocator is rarely used, most users use
> > > zsmalloc. zbud consumes much more memory (only stores 1 or 2 compress=
ed
> > > pages per physical page). The only advantage of zbud is a marginal
> > > performance improvement that by no means justify the memory overhead.
> > >
> > > Historically, zsmalloc had significantly worse latency than zbud and
> > > z3fold but offered better memory savings.  This is no longer the case=
 as
> > > shown by a simple recent analysis [1].  In a kernel build test on tmp=
fs
> > > in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the co=
st
> > > of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> > > sense for zbud in any practical scenario.
> > >
> > > The only alleged advantage of zbud is not having the dependency on
> > > CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> > > zbud is only used by zswap.
> > >
> > > Following in the footsteps of [2], which deprecated z3fold, deprecate=
d
> > > zbud as planned and remove it in a few cycles if no objections are
> > > raised from active users.
> > >
> > > Rename the user-visible config options so that users with CONFIG_ZBUD=
=3Dy
> > > get a new prompt with explanation during make oldconfig. Also, remove
> > > CONFIG_ZBUD from defconfig.
> > >
> > > [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=3D2Ww13sCj4=
S3i4bNndqF+3+_Vg@mail.gmail.com/
> > > [2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@go=
ogle.com/
> > >
> > > Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> >
> > Seems weird not to Cc the folks listed in MAINTAINERS for ZBUD? Unless =
their
> > addresses are known to bounce?
>
> Ugh I had them in the CC list, but I played around with it and probably
> lost them :/
>
> Seth, Dan, apologies.

I haven't contributed in this space for quite some time so I defer to
more active contributors on this.

If it is true that zsmalloc has no/negligible deficiencies compared to
zbud, it seems reasonable.

> but at the cost of using ~32% more memory

I do push back here as this % could be highly variable depending on
the compressibility of the data.

If the average compressibility is ~50%, zbud should be very memory efficien=
t.

If the average compressibility is very high or very low, it is less
memory efficient.

>
> > And ZRAM maintainers should also be Ccd?
>
> ZRAM does not use zbud, I can definitely CC them but I don't want to be
> a source of noise :)
>

