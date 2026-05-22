Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD3B183CC3
	for <loongarch@lists.linux.dev>; Fri, 22 May 2026 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779409642; cv=none; b=fXmrYW3xQUl60OkmTsoL3Ydw5oHt1/sE/T4FjVB+ug6+y0y+7hlPCV/82ocWALTw7HP5mb9QN84xiSxR5PmLzTR5+Tz92m9jhl0BDs0oE4r+gaog4oUViYe26zdMpIKt5CipGbndqhQTDC+IwSDKDNfD47t9nzmYZpMYCzDvhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779409642; c=relaxed/simple;
	bh=OeaBJnpyh+HO3KMXuAPZK5iYCsIl+yzigcjSPICIOXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cM8bhMaW/V2UvN8umRN9N5gZAyQ1TGhq91qLdq1j03CQ5UQGadOtuJpNKT/rC91FNVxcq4DA0gZa7b19SK5BSkNZQPavyJP3SwWwsWHftJMqzpXFnwGcIrv5bdcKpX1ylT/kCgIGwLRVU5loM8QgPHKsBYqn33cKhxdqaFqZRFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AzSyELu3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AzSyELu3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso49321815e9.2
        for <loongarch@lists.linux.dev>; Thu, 21 May 2026 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779409639; x=1780014439; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ay5nOcwCJCKL9kJTKSvIioIW4guYTs+JXkN6Y689XM=;
        b=AzSyELu3VK6W8jR4HkAXI3/zy1XZoLZhSCvfa0xqbxxnIL5f4IRkpOvu3aGMAPUhBU
         +mLUU3mdvI6zw+uwQQJ0ZqCiRCQXJaiCOE1eNuc+/1+Y9JTsL9DZoU/FI5dWF2kxD7PS
         D8BpinwrgyDr96K567e9W7rN1jHvX1GxWXsX7byCq6oGBUXMJ1G2NxnwW+gSdlkO0/nu
         l5RuGZf8go5nYOSOC9/NPIdgy6I55tjq9QXl2iy7XHxRKfm8h1Hfg+4BnbKJO8uwOkVb
         undaFx1wImYzWqf2s3JOc1z3+uZ0unzhofz36ujWLyEgjh2eCd1G+52o/ImNga7GAhZt
         XTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779409639; x=1780014439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ay5nOcwCJCKL9kJTKSvIioIW4guYTs+JXkN6Y689XM=;
        b=SCBDZ+W1L9jWPe/n7JXwR1FsPKLX7kDyiwTDfR6N/OevtU+x8VLqpzmyqpAWb9a+BQ
         4Yw0zqs27ftplsBl9Dv47X1dB/qWzcHTPRZuvOqtIfrsrMfl+IZABZWNnlLdRGL2rTTH
         FnwITgJVtOiMopEtAsNmR45e93muJ1k8oMzyb8isfyCVvUX45Dg3RU04FWlxkIqHqvL/
         gh1U8TAafLlDhBvtcuGjFfIeeWGZkcC+OnoR//UwzMHgmzt7RLrhbtU3HnwbhX48ixuC
         5kYDDU5eIZLAneO6BWpsgwK8w5VUuNuY9LXqA8W/o4nZeC0lgdl/H9fmX6A+k+3U7Y7F
         4wBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gRDuaz22mkCnhAfYljMC5silc4pXk3KH1ny+uwkWOdFolBf0GR/atKW75va08CN0AHKFI2kcyhEo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrn+SxNg2oDd88mvbB5HyPYG1wEF3cMvW0yLVIQbLBh3G1Oqfu
	FM4KfR+Wu6o9ce27ioZtzkHu2UnV/T8JfJ8ihkYLOZ2foTPk0g2Z/26mN8gdaP+zFzQ=
X-Gm-Gg: Acq92OHF9EAjsC2FrwVwM/13V7JPEBpbq7pO961BoZELGn5EYS0u/HUmcL6cafRGhQo
	kddWlaZ4kHHuZiJ9+toxyqT24hlI3617FDayzZF+sasWKniczKuxPLuhVpGt8DB7PgDx5aXXWA8
	qIvm89gBn7QXPZNE9raZWnCTH4z7cuk2qaO9mrw4OoDhTEnzfv+A4BRzjP62O/hitzz17xRvIJC
	zS1ARfBxPUTzbnEfOYEwUBzXk12sHqWB66RLlJDif3KVnc+v3aUJYCbc13QPxAHAIs9FUBsWXKD
	MeNu/Oz/dEAdBkGir2T6fUrjG2AgZKCoNc9vGiPVKHuyFZjLyd9x1rTJfpSf8RUf1BnOd4TQGzY
	qDEzsr4URbXLoYr2MACwyS1BEu+XRsdcG/Ivnu+sjc2Xn/cRDIOwAJBxaJDqK5voJuMl4FT0viZ
	FG/ouFTSSdfXKdk5uR8gERK+EgaY0oB6fZT6n27PdIkAUqxHFUMGFvlz2ehXQomZVqr1WTMos0V
	tsuGcOB87HHA4euDDInnqvDU3O+RUD/CSCbuJjuOFOaRRf3Rqn+fFA9ug==
X-Received: by 2002:a05:600c:4ecc:b0:490:3c90:2cda with SMTP id 5b1f17b1804b1-490426cef73mr10709345e9.20.1779409638952;
        Thu, 21 May 2026 17:27:18 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1:0:2bb5:f164:6e6a:38d8? (2403-580d-fda1-0-2bb5-f164-6e6a-38d8.ip6.aussiebb.net. [2403:580d:fda1:0:2bb5:f164:6e6a:38d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb0f91bccsm4187125ad.36.2026.05.21.17.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 17:27:17 -0700 (PDT)
Message-ID: <cced8d26-d846-470d-b112-344e53ec1b9c@suse.com>
Date: Fri, 22 May 2026 09:57:00 +0930
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
To: Andrew Morton <akpm@linux-foundation.org>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Christoph Hellwig <hch@lst.de>, "H. Peter Anvin" <hpa@zytor.com>,
 kreijack@inwind.it, David Sterba <dsterba@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Song Liu <song@kernel.org>,
 Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
 Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-raid@vger.kernel.org
References: <20260512052230.2947683-1-hch@lst.de>
 <20260512052230.2947683-2-hch@lst.de> <20260512114231.GG2558453@suse.cz>
 <20260513054742.GA1018@lst.de>
 <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
 <20260515043705.GA3855@lst.de>
 <34C16854-1065-4542-8836-DDED58EC1844@zytor.com>
 <20260518051207.GB9374@lst.de> <f46636c8-80ba-4802-a6a0-74cbc35e7bee@gmx.com>
 <20260521171730.7872482df453975cf60ce7dc@linux-foundation.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20260521171730.7872482df453975cf60ce7dc@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/5/22 09:47, Andrew Morton 写道:
> On Wed, 20 May 2026 18:11:09 +0930 Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
> 
>>
>>
>> 在 2026/5/18 14:42, Christoph Hellwig 写道:
>>> On Fri, May 15, 2026 at 12:59:34PM -0700, H. Peter Anvin wrote:
>>>> I don't think this is a good idea. Error out; it is the btrfs maintainers' job to ensure user data isn't lost.
>>>>
>>>> The RAID-6 code has *never* supported only 3 units, and if it ever worked for *any* of the implementations it was purely by accident. Speaking as the original author I should know; this was deliberate as in some cases the degenerate case (3) would have required extra trays in the code to no user benefit.
>>>>
>>>> I would not be surprised if the kernel crashed or corrupted the page cache in that case.
>>>
>>> It does, that's why I wanted to exclude it.  Anyway, for the about to be
>>> resent version I'll drop this btrfs patch over the stated objection and
>>> will otherwise not change anything.  This means the (IMHO hypothetical)
>>> users of this configuration will get a WARN_ON_ONCE triggered, but
>>> otherwise keep working (or rather not working) as before.
>>>
>>
>> For the btrfs part, I believe I can get the current 2-disk-raid5 and
>> 3-disk-raid6 to fallback to raid1 inside btrfs.
>>
>> I hope the btrfs part can be finished and reach the next merge window,
>> but I'm not 100% sure.
>>
>> What is the planned cycle to merge this raid5/6 cleanup?
> 
> At present it's on track for the 7.2-rc1 merge window.  Does that suit?

The current btrfs fix (*) is pretty small, I believe we can get it into 
the next merge window, as long as we got enough review on it.

*: 
https://lore.kernel.org/linux-btrfs/a1d63733465229936351804f3760803d5894a962.1779274630.git.wqu@suse.com/T/#u



