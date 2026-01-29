Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBE3590AF
	for <loongarch@lists.linux.dev>; Thu, 29 Jan 2026 02:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769655175; cv=none; b=JrM8U92luJ+vteCUusi4hY4ZH7TK7m9sl40NPTo50/FOWjDK3zoLmFNGV6ToE8bZc0LiSmxUk0rOvCX4wVHVTAm2SuCmSt3jO0frZwuw0RgfKqBwMOwwY+WyCdzb3vYw+Qe/bHfzg9XjE4t1EiX1rw/5PcwLTA37UGBAFRGG3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769655175; c=relaxed/simple;
	bh=mfj64IcwXKuAswN64BKy+GaRzOkqTPEFZRcVNE7fDg0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tWbITWEEEac7gyWjt7y3oQTQyTdcLuJJnJVgQF9C6e061vW9VA0FFYiPj5c406Y7HuXM7UxrOxeMW/x/IuZv7l8ooEcxvBT1IJGBbSU3gxe2MD0ov8ElfH9lJ01vIpnD82HMdCpbMKw+11ONe6j8gZ6pKRB155mqZ+t04gATr0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zsd8oPGy; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zsd8oPGy"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769655155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zUUCdyLNfxqZr/JB01jIM2hS9AGiun290KshO5xiDNo=;
	b=Zsd8oPGyu5Uk7qrMcCaR8as8UdOPm0CloBX4g8v2jaMMG87yYzKAcVcuJedg4e4kWo99Sa
	NPGVL+lCQu5BYDf4/XNR/VoyJqvKO5RNqOfvzWLYF1jd7rZlr/qOld56WiPELa5NB9KUBH
	hkDYJGOnOocrlW7Cn5jC7PQp16cezk4=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv5 10/17] mm/hugetlb: Refactor code around vmemmap_walk
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260128135500.22121-11-kas@kernel.org>
Date: Thu, 29 Jan 2026 10:51:48 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <1E5F65B7-59C0-463D-95EA-808520C14B85@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-11-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 28, 2026, at 21:54, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> To prepare for removing fake head pages, the vmemmap_walk code is being
> reworked.
> 
> The reuse_page and reuse_addr variables are being eliminated. There will
> no longer be an expectation regarding the reuse address in relation to
> the operated range. Instead, the caller will provide head and tail
> vmemmap pages.
> 
> Currently, vmemmap_head and vmemmap_tail are set to the same page, but
> this will change in the future.
> 
> The only functional change is that __hugetlb_vmemmap_optimize_folio()
> will abandon optimization if memory allocation fails.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

