Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205003;
	b=qe61Dcay0IlX6OsAdnGItNPE3R+uiJtxZMtBeKoCzArIvd2EH3hLtlxsgg0MVkUHie+3
	 rCyQXIljTNNDyQd7LaeP0ntan6zCJKHxKCGF50mBth3nunARpSZOE/3kokmMvjkBRZrfn
	 I9vWZ30QDU1ACWFUIXkJaMVO5DpkzDTYplDxl5T6kK7FQSbbdjhwPtr3ZcsHnPrS0DShC
	 9Qg1X9BBI20vEL4g2RHK1/ptFTSJ1sHWDqoCPWgV7QI1EhOw6DnpCSSk5qFUhkUk+1NZN
	 mzmofByy1MhcCVPBWjMwuIKiUsZtl0eMAdjt5CW3BZsdu8pBzlzMdBW5Ed6nZtx0/iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205003;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rLoo3d8wA/2dmWzlOHmZSdy7DBfGYigRliA9FCVCD2U=;
	b=BTx1vho5a3Mn0b7JkdnaR503ybTYOqNmLwUicDOIcd8BqEndDx7v3/rpdNM0GHhtGr3L
	 RVbqfMjV8ADRoLuBG577oOQHQYe4plAray5Ul7yJoAKiEjM/sZTzIMrUXf6p1EiS3RevA
	 J1wUqwcZmK1RRXLHPJVFiQDhP07mef7kp5c7VgICrIGY5BoBvN065FzbgLqgDZnBi8B67
	 uqO2nWizBvoVj5dlYqs2eViQ/UrlaBIjGqDB3fNVVhvq4K38oRT3MuAooB1i67k/ocHFS
	 NeVA8q+6mvsAfnWQFeOCcJoPIFV+B1vwy74qg43N7wqwxlGswKgku0/qKIKZStGAbXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YdOHLkm1;
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD3606A321
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 06:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAD3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YdOHLkm1
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rLoo3d8wA/2dmWzlOHmZSdy7DBfGYigRliA9FCVCD2U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794205000; v=1; x=1794809800;
 b=YdOHLkm18ej0NUagkOx5fL3TEOgHMQ4gnUIWPRRwP2usH38o0YIcXOhwUKSi9HBHrLmHN3CF
 VnYMJvdPfaRR5Gnc4oHs25xqt4OL2JddMSYjRcOZQnm+keRRQyCMa8U5/cjU5k8uVN1qEiWUb8p
 luxB4nmOtrLFMWZo/OoPRgjQ=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b7a98a3c4281100a;
	Mon, 09 Nov 2026 06:16:40 +0000
X-Mizu-Trace-ID: b7a98a3c4281100a
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
Subject: Re: [PATCH v3 5/5] mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs
Date: Mon,  9 Nov 2026 14:16:30 +0800
Message-ID: <20261109061630.47601-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107043122.25650-6-songmuchun@bytedance.com>
References: <20261107043122.25650-6-songmuchun@bytedance.com>
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


On Sat, Nov 07, 2026 at 12:31:22PM +0800, Muchun Song wrote:
>The vmemmap population and memory hotplug paths no longer need @pgmap
>to decide whether a mapping can be optimized. That state is now carried
>in mem_section, and the architecture-specific population code can make
>the remaining decisions internally.
>
>Drop the @pgmap parameter from the vmemmap population helpers and the
>related memory hotplug interfaces, and remove the remaining
>dev_pagemap-specific coupling from those call chains.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

I had another another another look and couldn't spot a missed caller :D

Might as well stop passing pgmap around now that nothing down there uses
it.

LGTM1 Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
