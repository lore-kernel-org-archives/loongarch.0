Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74041814
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658839407; bh=reMeeEYHUwJQlRn7b0h9JJS5ohzCDf/OhL9kjf9fXAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V+9Ylv74z8d6Vifxxw9vn7WqNsYZYo61QeAJW75SJhhZ/vL7c6CNVLONDeNH3qs1u
	 fds/NqiLyc5Sr73BibjZBO5xclLpZEmgUiiz/mAjUlHImODyuTGVELpngVXx9b+Lhs
	 MS6TqakhzmsoSZuqYEqupL2uEJDPj8WBrdpFxN8w=
Received: from [100.100.35.250] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B1B6560610;
	Tue, 26 Jul 2022 20:43:27 +0800 (CST)
Message-ID: <53ce5f33-3c47-8c1d-b7d6-62e59aad812e@xen0n.name>
Date: Tue, 26 Jul 2022 20:43:27 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:104.0)
 Gecko/20100101 Thunderbird/104.0a1
Subject: Re: [PATCH v2 3/6] LoongArch: Remove several syntactic sugar macros
 for branches
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
References: <20220726122920.2291947-1-kernel@xen0n.name>
 <20220726122920.2291947-4-kernel@xen0n.name>
 <CAAhV-H6Q9VNWBevwA-ekv6KfZ5okck+Q9XONNCv3THTwSAhGUw@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H6Q9VNWBevwA-ekv6KfZ5okck+Q9XONNCv3THTwSAhGUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/7/26 20:39, Huacai Chen wrote:
> This patch should be the first one or the last one, why it is in the middle?

Maybe in my mind the order of the patches doesn't matter (except for 
probably the cmpxchg.h changes that involve neighboring lines) because 
the changes are independent from each other?

To save everybody from email churn, you could adjust the order yourself 
when applying this series. Either placing it first or last is fine for 
me. Sorry for the additional work.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

