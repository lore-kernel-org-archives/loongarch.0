Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203313;
	b=MwofEAEtGl11X2v90pqOZtuB94yPnU63CZongI4J4oZHHG8uudtytGFp+2oswfldZk0g
	 FOMyX8+5CQvhAd9eyX6UoqFGJeUQfq7mQ3Y+sctCP2Fo1XxagwEmD/EGMNfLUA1zXVhSM
	 jyupPpPEkELLvz2WLQgas2S9zIesRVzJKmj86lqcvvY6nVUZEAwHiYlJtmjaC6g/7+A5F
	 bFJckQHws8GFIX8CWTS4xRWVL1aPfK8CBwMI8EKNB7m/Fkg3wztJ8+Cda8XbldLC72ij3
	 K4uJRaNO2MUkN5eDuiN52qgEUueZihBQuDXVirkhZoA+w73NnLKD6S+eQ12mLCtQ4ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203313;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JSOyM4K5zrqmDFF61CwIn14s5ShEHbu2alo+0Cxugro=;
	b=pSS6qYFinK4Tncu9xA4T4FkqkTdSXw0RYcq0xhOsFnLaniGTY2pZsMwu/pDVtQkig3Uh
	 8By+Q/HFcCmuBYf7qF+KhQfE5UOePJKgjiyMj90nDj2L686Sup1TZZAqhIEzaBzefGD3/
	 DXQLn4ZSnPY/kZOEWlBefKWhLzJ9KupMSxDw039A+6hfojFMI7g7FL40aTFmek5lrMvIW
	 pnaqCsFfaFSNHavkwK+IfoLxKJSEJlq1IJ6/MsayKGkNny7g71oiI1gZMBgqYjnG/UciV
	 wLu0oCnCb6HZKc4k7mT/0t9ueoD0S9mP60HI1lk9/iQ20Z+QgLc1TYVEdEwXqOICMOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MMq0OsFY;
	arc=none smtp.remote-ip=91.218.175.55
Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA33C606A31C
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 05:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA33C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MMq0OsFY
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=JSOyM4K5zrqmDFF61CwIn14s5ShEHbu2alo+0Cxugro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203309; v=1; x=1794808109;
 b=MMq0OsFYOeDFfLKeanMq/JRW5emG22N+JN82VeucMQQPT+M2lExIrVamS+c7q+asXdJ1pdl2
 1X0kSw1FOEdPQI/obnIvW1WVZJsWlAMtC3SyfA526L1kdBXP241tfsR5N7B2uuz87yZGgwPpUpd
 dE+PwLyiJkXRbdzGAO40uSAY=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id bae7ce2de6921a50;
	Mon, 09 Nov 2026 05:48:29 +0000
X-Mizu-Trace-ID: bae7ce2de6921a50
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
Subject: Re: [PATCH v3 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Mon,  9 Nov 2026 13:48:23 +0800
Message-ID: <20261109054823.45056-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107043122.25650-5-songmuchun@bytedance.com>
References: <20261107043122.25650-5-songmuchun@bytedance.com>
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


On Sat, Nov 07, 2026 at 12:31:21PM +0800, Muchun Song wrote:
>section_vmemmap_optimizable() can already decide whether a section uses
>vmemmap optimization based on the section compound order. The DAX-specific
>vmemmap_can_optimize() helper duplicates that policy, so remove it to
>simplify the code.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

With the arch fallbacks handled by the previous patches, we can just drop
vmemmap_can_optimize() now ;)

Nothing jumped out at me, so:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
