Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290C1552E3
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738059677; cv=none; b=Tx/OptqyHkyYwc45C9V9hl4owZY6kfbsxD2bXZS8bGSKB76RSSgS81eoWc7n2moHffE1ZkK6zXiRajAJoJpmld+yxODinD+z9uYCGHNvMAvsIQfXZcMxNWAdrQ7tmnQEV3HQgdup9z/kwkHKBbpM/LQ+ID2mcsWq8xwNuoJipNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738059677; c=relaxed/simple;
	bh=7xEHRJYaUsQvrBOYsPKXuqOIfVMZpJc7qzGeGCJiEMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XoG7nKISDzNEjH0+RDP7SaEjJ92/dCKs0MRQZvA+/6F0qzI7R6Bsi6dB79mdJf9lNpOsW8+lar3AW2Lv/IeYp+oBV8IojfvaDejyUEY5VSfgFF805XO293/dn/PK2G6AIAfc0LlOGOib9kWtii/dSfmQrXoS7Esmxl29WCMsV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=g36uavjX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=yx9Jc0AR; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=g+Fgny1H; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=5S+hwuSr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="g36uavjX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="yx9Jc0AR";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="g+Fgny1H";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5S+hwuSr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 33395210FE;
	Tue, 28 Jan 2025 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738059672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tC+2cZEkBuB0y/+lTz0SnDws8RVSzWbW63TPef5d7E=;
	b=g36uavjXeMSLDP/wQ1HXXbBmwofmqc4NuILpzZ/cEJfjqepzlsgdZZ/RletOmfPNMc2nRG
	UtssTLKRpWjUU+m1jT41JmtCQe7rlDg4OROZd0GoWX0APM2D0lmt+4dkJamGGE9a/GfAe8
	tj8xKX8wcHlMsk3YfZdhsvIDuTtEwaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738059672;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tC+2cZEkBuB0y/+lTz0SnDws8RVSzWbW63TPef5d7E=;
	b=yx9Jc0ARX9Bx3AqfjaSLTx4wSNg9Uba/gustUdf1ReUXpZsyyeDaC7wd7e86uJIarhToKM
	92eCJLK0GGSNbgDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=g+Fgny1H;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=5S+hwuSr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738059671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tC+2cZEkBuB0y/+lTz0SnDws8RVSzWbW63TPef5d7E=;
	b=g+Fgny1Hr3qqaouwF1HbBTLA7jY1DvL3G4Bu5oJkzQOfsn127wx4bPIRMy+lSiKfmRU+lX
	pOdAB/9MW+TXdi0VFCKELw60hFSrf8FN2RWurftmDo+LSlze72EHrQxGCusCXJIMzr6e3k
	2albBV0vT7bK6ne6vXkQaB/QdmLLRJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738059671;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tC+2cZEkBuB0y/+lTz0SnDws8RVSzWbW63TPef5d7E=;
	b=5S+hwuSrQgYmhVb7vuI3N0z1g47DRpbJaEFqccOl1kfSxzMK9/a3wwM2OyiMSm5q6XuxMc
	3xV/1dKQkx7LvgDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12EB013625;
	Tue, 28 Jan 2025 10:21:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ybdDBJevmGfrbAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 28 Jan 2025 10:21:11 +0000
Message-ID: <42b24914-719a-4ff1-9d77-f6517717344f@suse.cz>
Date: Tue, 28 Jan 2025 11:21:10 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
Content-Language: en-US
To: Yosry Ahmed <yosry.ahmed@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>, Miaohe Lin
 <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <Z5gdnSX5Lv-nfjQL@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Z5gdnSX5Lv-nfjQL@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 33395210FE
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[konsulko.com,huawei.com,cmpxchg.org,gmail.com,linux.dev,kernel.org,xen0n.name,kvack.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.cz:mid,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 1/28/25 00:58, Yosry Ahmed wrote:
> The zbud compressed pages allocator is rarely used, most users use
> zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
> pages per physical page). The only advantage of zbud is a marginal
> performance improvement that by no means justify the memory overhead.
> 
> Historically, zsmalloc had significantly worse latency than zbud and
> z3fold but offered better memory savings.  This is no longer the case as
> shown by a simple recent analysis [1].  In a kernel build test on tmpfs
> in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
> of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> sense for zbud in any practical scenario.
> 
> The only alleged advantage of zbud is not having the dependency on
> CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> zbud is only used by zswap.
> 
> Following in the footsteps of [2], which deprecated z3fold, deprecated
> zbud as planned and remove it in a few cycles if no objections are
> raised from active users.
> 
> Rename the user-visible config options so that users with CONFIG_ZBUD=y
> get a new prompt with explanation during make oldconfig. Also, remove
> CONFIG_ZBUD from defconfig.
> 
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Seems weird not to Cc the folks listed in MAINTAINERS for ZBUD? Unless their
addresses are known to bounce?
And ZRAM maintainers should also be Ccd?
