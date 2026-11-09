Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198424;
	b=KjnV35p9Ahaoh+aIgtYU54SWgYSDJmBDzLkM7ikOfV7YA5ghmlfFTBygnZWzCXpWWI9l
	 2xvzG2TPCgeuMZoxvl7bDjJuLMtr/3ycrx6A4lz+ItWwT8GOWYW/NpU0GMNdTWnRqeYq/
	 7E6qZY30D0xgXSOXTHfrbnH6IaMQ2tUsMcD5MbF0fCLVCHy5a1n4WOgSXnPyIPfLqkvIx
	 jnpGmDk69/GWyJKnKN2OPWqBj7Q7zq5Lj+i4TM4FuMD0FF9ytdre4H21AgHy2y+1f1Hry
	 A/y2z2WVbhmmFVYKXx1i6z0kNaaD+4f99r+3Hx+tphS84mghjptkktbe2G50/6vtXvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198424;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0SVPjoU02fufplg6UCU1lm8OR+hTiBw+cX99Xog7iH4=;
	b=Jx6DA+Bxmpp2LjCK2VMbq8r5WIebsCxG0gCM8FG6p2hdcKAMY3yTFg0c2Z1k4sjMSpJU
	 CZbDeO/Xi82lm23oUk6hDAlICO6kZTW2zc1NiSEcq+PfwFXs9GVklbo8epyn/bkobImE4
	 7WHZcO0qTlWcfTYQXRg4bWI5yRNXoIvzFnVuAM5TuS1C8ApWbggYNbNPdpSi3k+YWq2e5
	 3EXrIJHAx2Nvi2z8RZnniz/gFewxb94q7JPvLCOvEWXqGWUzX5KBXDtrgNXagZCm67O+f
	 vHN5YcSNwzqyJSam1H7TR5mXIP6Ygddb3kfnnF4/1JasyGMWnEcCCg5inESLRc3y37Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19062606A31C
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 04:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19062606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=0SVPjoU02fufplg6UCU1lm8OR+hTiBw+cX99Xog7iH4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794198415; v=1; x=1794803215;
 b=u/Gx8aBgnHUkuXVi2+BQTYcTDxH8zFUmAR/TVFAy46WVUw8Lm9l8nbKAhmANIRo5EFy9lMew
 uqhCIgOleT3njpCY3/Dv7cMDqi4bwx/iXr8FHzCyP+4xEO4rb2Uae+SFRzrmb+HNtjjXKcUWcSf
 Benz8ZX3QBGriDvnxTFBIbfA=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b6a087d0e32380d8;
	Mon, 09 Nov 2026 04:26:54 +0000
X-Mizu-Trace-ID: b6a087d0e32380d8
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: david@kernel.org,
	maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	osalvador@suse.de,
	qi.zheng@linux.dev,
	muchun.song@linux.dev,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Mon,  9 Nov 2026 12:26:47 +0800
Message-ID: <20261109042647.37323-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107043122.25650-3-songmuchun@bytedance.com>
References: <20261107043122.25650-3-songmuchun@bytedance.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sat, Nov 07, 2026 at 12:31:19PM +0800, Muchun Song wrote:
>Whether the optimized mapping can be used is now decided in the
>architecture-specific vmemmap_populate() path. When PowerPC has to fall
>back, such as on Hash MMU, it can disable optimization for the populated
>vmemmap range there.
>
>Add section_vmemmap_optimization_disable() to centralize this fallback,
>use it in the Hash MMU path, and drop the radix-specific
>vmemmap_can_optimize() override.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

LGTM, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
