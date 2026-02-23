Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E47F36BCD6
	for <loongarch@lists.linux.dev>; Mon, 23 Feb 2026 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879625; cv=pass; b=bDFUJJ2tr+TvHlsswi2jeU8C4ghaIEC+uXfaESaiEJfkeq6fbcY0cCpHpAq0o3VJbQQrxRLF3lgSLDJeBFW1OZlGRvShJFXl5+gPlpSBt1NMorNnQSCwbA11FcHGFvfEp3HWUKh7vmRW7ksKRe2+wruuzGMWNxYyxJWFarHgua8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879625; c=relaxed/simple;
	bh=EVemFSQFzNJxJhu0+Ux/v0A4lvPBlu5NCCP1e1e9qzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DE6f7FhKAlsPlK0SNzcVEv69/ZC0JI+VeySVvkYCFMbP5fkNlexOkyJug0pN2prw/NQX2fq+Mb8G8g3Od79AQ6QWKO2Q63tf2IEZTToKvoNsQWqEyZ3knuWQ2je30ERviVdYF4M9sjBDadOOt7QD0F+ZIrhokv5kBBmdkb/XVU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YLXdupFb; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YLXdupFb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48371d2f661so575e9.1
        for <loongarch@lists.linux.dev>; Mon, 23 Feb 2026 12:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771879623; cv=none;
        d=google.com; s=arc-20240605;
        b=BJTpwao+4Ub3I2COi4xeMae6cTyDF7KfGbgSWyLW2CNsOI0by2BIigx6600wgacMNW
         n/oYD7pY34bVNrZX1nU55Odt9I6CZ3xSoHzr2V41r/9VrLtRJjZ4AZjsTd4F6ptS0C9D
         5DJScyBayhz4OodhunnS+6AtxtDvqvChVp14N5L4gWnuSX4TQKj4wKu5rauFQxJkmW+w
         wQ4yh7/8VlswhfnUFHNWv1+LktCHd1sYgZM0G5UczP1qu6VynZ04H4NgsaYDUPGwMVU6
         T7bjM3Qrkdq41uHY9qDinDIpxDXWdC3VWCrDYlXh/BlM2d+Yhpyx9zszSag7ata7ACmf
         P8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        fh=trHyy5iBDNjxRYGANvcT4vbJr0P6jpM8ldNPyF9NtKE=;
        b=lHWKAPXkckmPXQ2VwIRKNxwcCqbbxTHpl91PzuBlkMtr0xxfbL1Ycpk1hx5uROBBrJ
         CfCe3BHBpDdfzvhwjjbyXDVzpiM88qRE2FebBdUlWNIvnxcbV106pjEQUF4ixU6Vlej9
         4oDPMibVk+/hMPTwJgx6/ZGbOqPvtTyLipBfFRvkqw4VNiCY0nQKSSSbQKIxpIYknn3M
         gNrAHIFYJ2np2IUZ71QdNPDw3UfqX74uBNRyoy9vdTsD4Z7RIfqxrCoVS2ET83Mx0mpP
         tD1owUi2ZGKPbDBOpxdgRRVSuWwfzfL6POu7ebEdW1Ic+0fszo90EVW3ueDToBV1IAkq
         kMCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771879623; x=1772484423; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        b=YLXdupFbDkUYanYQk1HhQhGz5PKt+VJR0VRAEB94p6wrT2Lr04adjDJR4OmUJc/RZx
         JsARHBkm3sKXVA9GwKmNQk8LQcIoKP9ioBMmuhG4S+VK1cuTsDe+oY3iRMw+b6pdXT6i
         1p4XhQQm9rFj49ilqTdmstqgIi5q+oSLSqptU1M7AvMO06T9CzJQqqIqXnjNz/ELOCmF
         S9ECmiKFf3PiER5twzvuWU8Iv5yyEWj9k7YMWi7oB7qFx5t8k2+yR+xas2PqA9zbbtvv
         hl/0Ev15j8rYhV9JHtVFTtEiect+wJxVTBnQOCGB/1cu5CWjCW1mOKn6ilkHZRXRnyfm
         H44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771879623; x=1772484423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        b=he5WObArFjLXpmkTUvNZudloRITHiEBjXRJiDEPDmyztv3ddn0cFm9L1WKu8Ty5Oze
         zMqx3KafR/eEirsD2fMjJtyq7Ua0FpTs1HpOXQ4OyoBGK2p0A/AXDP9B6cQoyX5CbTTb
         UY1Zwism7Ua+/ibgHHduiLumNQ3kaVJR+8i0fq2+zp3lv10qpnMzBrQKnG6mhdsfsz2d
         PVtwhQs0lxbb1RuFh0ob4TCEKs3hpQ+jACYTkTaxqb9fztKt22fsZF37n+qVr8/Py5An
         0GPjG7rKw4q52ZKP5ta0nLrbXHj/lbEKfrz2hb8+cwFfpW+qJSPnYuOCjkuUJMidId5N
         eFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9sT1GP49s3LX/YbwhKLq+5ZK0bBrcJQ+0ysxrdbnQdQyhMMTfXAdoxaEexSp9rsWpVkYVh5oPV7I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnPa66Y3daeYB89ELH2bGnrdLav0l0xBSvGuX/tFwVEf+BYG/V
	O83Oeb3qCctODT/LEvRkygfPUA7229VVfdukoRq6vhVehSdas9hrkm0mWCq+1NT5fsvGXN82onc
	oAxmh8wqUZ1XcWEe0J+i+yYvBaCprkfy5xriNoHg+
X-Gm-Gg: AZuq6aIjz4OK/kgNrAYkvMaMPMGdR6rEQQobbQYZ9ZEpeQprixAvgFXmVR7HnA7aU7k
	d9ZNJLMAA3xUZ1VHQrB3+K7W0UYuQILcbYnFGZ7/JpeVVz8qYyS9reFAlnqlXGjOhrF7pmRg7xV
	QC8s548jgXNsnRrJM1yhOJFWk4VmAj0P4rToEn3359yId6/ZJMnVSS0yH0+diFOBjg8q+Dz/4br
	uNcC3TbBQI8ifvRn5EaDM+qhp+07aiidN1i96BKt4kGRkzdNkaAn5Fw2xfk/nX1WnU5x14MPQXJ
	lnvxAMc=
X-Received: by 2002:a05:600c:4454:b0:477:86fd:fb1b with SMTP id
 5b1f17b1804b1-483b878837emr163415e9.11.1771879622202; Mon, 23 Feb 2026
 12:47:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202155634.650837-1-kas@kernel.org> <20260202155634.650837-9-kas@kernel.org>
 <aZJTLwV2SaaKu1k_@casper.infradead.org> <ec4a9a1e-8c08-4879-a787-3b9e0bc38160@kernel.org>
 <aZyZ2-7Xr-zUnInC@casper.infradead.org> <9a972701-00b4-440d-8bc2-24b8dc469843@kernel.org>
In-Reply-To: <9a972701-00b4-440d-8bc2-24b8dc469843@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 23 Feb 2026 12:46:50 -0800
X-Gm-Features: AaiRm53V0083kx17uKl1QJe6iH0-QHdntImophIuh0y8aAfRVd2RH3p-ebZ7RBQ
Message-ID: <CAPTztWbr7y0myXB17Vz5HEZTw8a3PJ4qaxRKgtZmt-qXx1ofeA@mail.gmail.com>
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Usama Arif <usamaarif642@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 11:32=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 2/23/26 19:18, Matthew Wilcox wrote:
> > On Mon, Feb 16, 2026 at 10:06:57AM +0100, David Hildenbrand (Arm) wrote=
:
> >> On 2/16/26 00:13, Matthew Wilcox wrote:
> >>>
> >>> You're right that different pages in the same folio can have differen=
t
> >>> zone number.  But does it matter ... or to put it another way, why is
> >>> returning the zone number of the head page the correct way to resolve
> >>> this?
> >>
> >> How can a folio cross zones?
> >
> > I thought 1GB pages in hugetlb could cross zones?  Maybe that used to b=
e
> > true and isn't any more, or maybe it was never true and I was just
> > confused.
>
> I recall that 1G folios could end up in ZONE_MOVABLE (comment in
> page_is_unmovable()), but my memory is fuzzy when it comes to crossing
> zones (ZONE_NORMAL -> ZONE_MOVABLE).
>
> Freeing+reinitializing the vmemmap for HVO with such folios would
> already be problematic I suppose: we would silently switch the zone for
> some of these pages.
>
> When freeing such (boottime) hugetlb folios to the buddy, we use
> free_frozen_pages(). In there we lookup the zone once.
>
> Likely also problematic :)

HugeTLB folios weren't supposed to cross zones, but they could do that
in some cases for bootmem (memblock) allocated pages, causing the
issue you describe.

I fixed that with 14ed3a595fa4 ("mm/hugetlb: check bootmem pages for
zone intersections"), so they won't cross zones anymore. The other
allocation methods used for HugeTLB folios, alloc_contig_pages() and
cma_alloc_folio, won't return anything that crosses a zone boundary by
their nature.

So I think that's all good.

- Frank
