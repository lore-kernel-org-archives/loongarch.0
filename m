Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939896;
	b=s+mUEpeOms9AWgcEKEKKoYQ0vbqUVB2zn5ILSRpXAKyV2DGcb/BqQ4m30PgDV+T/XOgN
	 zvV+off6BX0/isU3pZ0lib5Ie8liwnE5RbN5jS58r7f2r8EIJkC0I+ZPB3mAtuszdg303
	 Vd0BfJUxcVw4+FlaYC1yHh9S+I+iYJGZRjt4C3v/5rZ7ecFSwvka8aqWvWgmwiiluK3tS
	 8n75jzLWKXtJnQ1UTZjg1jgD37PwX0FojT6+iwS6xaVBUlBaB/3t6UpMqSdFWpmqzh4j0
	 BdYwtdGPy4wYBhklk+eBG5scKc3xZqYjV2XhRFwIU89eZsaJ/i/lEdzETq02yppDqMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939896;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/Yx3i1zeQ5pe4eBI/JzCvDsEdxLLepzecCOmB7O2Y5Q=;
	b=2X/qWnVlqHQo2FUtt1+5UhVihE+D1mE93cubeazo4oxL1zCsJ+52teNg5/bX+BGpXWrN
	 0AOQm/dKFzz/oo+hKliLtWj2gzCsFLwAaQE8lGWYyMbwFHiyjLyA0cleGV8+MMVRTdvIJ
	 kw2pv582aHdrdNW47UZcjuQcpZLJJMWJ2Zu2sgJ7i1yRqC5sNrMI3wD9QZrVTD2SRFS16
	 fe2IfkEAjkmLAwWyQ3IITLkjLUfjYJgjcDr3evlm7ClUys5ogTrUpO92qtPu/eAWgbnBe
	 c1IQl6vLrf2VQqPI1JEucazvb2BxkbP2t+cOh1JtagkPNnE5+nV7wTBWfFm0aQx7JXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h2NarzBu;
	arc=none smtp.remote-ip=95.215.58.113
Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3F606A326
	for <loongarch@lists.linux.dev>; Fri,  6 Nov 2026 04:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D3F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h2NarzBu
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/Yx3i1zeQ5pe4eBI/JzCvDsEdxLLepzecCOmB7O2Y5Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793939893; v=1; x=1794544693;
 b=h2NarzBu5wSfv3HGLjDaliK2QJozxMk1T8AWSAyQrfXgHTDTPCv+ZGuVrnREakda/ZEx8QA1
 8oHdr4LZFwNJAxqLIVYaUXa8CPvRrYRT1iKnDBFCbx5htEVpTCoeBhb92BY4AQ1xCcuyadvcBnR
 1nSZlm5DlYnhXsdFYvkrWORw=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 9188c1b74d12ac2b;
	Fri, 06 Nov 2026 04:38:13 +0000
X-Mizu-Trace-ID: 9188c1b74d12ac2b
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
Subject: Re: [PATCH v2 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Fri,  6 Nov 2026 12:38:07 +0800
Message-ID: <20261106043807.32969-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261105061217.13302-2-songmuchun@bytedance.com>
References: <20261105061217.13302-2-songmuchun@bytedance.com>
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


On Thu, Nov 05, 2026 at 02:12:13PM +0800, Muchun Song wrote:
>vmemmap_populate_compound_pages() is no longer used outside
>radix_pgtable.c.
>
>Make it static and drop the unused dev_pagemap argument from
>its only remaining caller to simplify the code.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---

Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
