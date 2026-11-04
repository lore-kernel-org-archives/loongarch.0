Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787494;
	b=yBJ/Ifk7OFEpWtjAIo96Cgm3woYrDJolkqVdowGswrhka5/YM2+GZKcg+aSnWJRjaMuI
	 gchlBtozu0TXbBrv/Nnj9iy1wMVym7zkUW4ZbOJ608E1kVRFYymdtCUrzWWyyA0UwVsx6
	 tqVO6S5RNqMAnWWz1fZE74zC2ufiK9CIiTOuZ7XvlaPXkA2dFPZM3LtzQOhvBN/5MCq4Y
	 EJXO+3jvVUWt/l37j6sb7CK3it087DSt2QEpBNTWttxBRpar0RNKBXvAs0jKOvCnLG25N
	 PfoBMK7DNvkDH4ANAHrRQnV6aqS7oIUzTpt0VYHd58F3zh2FYSRSCPo6BSoa1KysmCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787494;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kzlN/YSlDBcWBl/PHuR26tChnN3ik0juVI5FwAqXzXw=;
	b=uhh0xWXMbAaTrHoqPTxQvnOXK/sHHjsB1Zmg7H58ywfZcrpSNYviTanArGkvpaQM0ZoR
	 BnCrkMFjMWhGpAKCU0dm0iDA53jygJ/N4fokkSHsBv4ZhH/E8qrKKo+DAMEM89Zyc7hg/
	 yusJE/Kqp+YNKqYU8rtfHF4dx5AXRe4oj/uBxQ0EKFBuhez9FYMMSJsCwdpK8n//KLcoM
	 BJ9cnWv0OX1Z3A4eapuDqJbLX/yoWdbcRMfLZ3aUPuLxPbwNNS048qAV6z3ERbURzJ1mU
	 zk5HNkGw1MvusSb0kMhi60S1tpLWJ75dc1QpG2HAjvRLX9MbqXaToZBun1WsXt+lLfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="s/Dw6yqL";
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B1606A329
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 10:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 878B1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=s/Dw6yqL
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=QICrwvJ1q+p6O5FfC7tO/QRvFz9LYnqsPT4idoPDTMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793787486; v=1; x=1794392286;
 b=s/Dw6yqLjHgjK4hC+q3he0UIo9WlnSbuhHZictdeYHfn0g5eLA+/jLTEsDkKqQY+gbMBbTFv
 E0JxTJeYiHFf5PxfyrFlG4LPlvNpuBlWmQasw907mX2iCbXTKmT3DQAlg/i7orQfFNco2MRDl5F
 /JMtvzwzP+ultA/y2OOC4zBo=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b7af79601e9f84b4;
	Wed, 04 Nov 2026 10:18:06 +0000
X-Mizu-Trace-ID: b7af79601e9f84b4
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: yangtiezhu@loongson.cn
Cc: chenhuacai@kernel.org,
	hengqi.chen@gmail.com,
	loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] LoongArch: BPF: Make arena support depend on SCQ extension
Date: Wed,  4 Nov 2026 19:17:53 +0900
Message-ID: <20261104101753.20704-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102072808.23080-2-yangtiezhu@loongson.cn>
References: <20261102072808.23080-2-yangtiezhu@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tiezhu,

On 2026/11/2 15:28, Tiezhu Yang wrote:
> This is because the arena range tree uses kmalloc_nolock(), which requires
> 128-bit atomic cmpxchg support, provided by SCQ extension on LoongArch.

There is an existing SLUB debug fallback worth checking before making
arena support depend on SCQ.

In __kmalloc_nolock_noprof(), the rejection condition is:

        if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
                return NULL;

Debug caches do not require cmpxchg128 for this path. They use
kmem_cache_node->list_lock with spin_trylock_irqsave() instead.
With CONFIG_SLUB_DEBUG=y, booting with slab_debug enables this path;
CONFIG_SLUB_DEBUG_ON=y enables debugging by default as well.

The proposed bpf_jit_supports_arena() check would reject arena maps on
CPUs without SCQ, even when the SLUB debug fallback is available.
This would prevent us from running arena tests on those machines
with slab_debug enabled.

Could you rerun jit_insns/cast_to_user on the 3A5000 with slab_debug
enabled, before and after this patch? The claim that kmalloc_nolock()
requires 128-bit cmpxchg should account for debug caches, and it would
be useful to preserve that fallback when addressing the error reporting.

Thanks,
George
