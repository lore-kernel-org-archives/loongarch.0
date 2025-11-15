Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7C519DF66
	for <loongarch@lists.linux.dev>; Sat, 15 Nov 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197781; cv=none; b=L7KL93geXKNsK7Pt2B/VUNvhUCO7c0jP/vWZXjMh6IOyasqcv+y8eIpX0CbCbFoaDUvep7DbMShuRBwUdRsbWkZzYYZcX4HiQ7g7BiZ/0kDe9fa7uFw9AyEcJAST5hllWugI3r1xxw/G/MNMBXHsOjCjsBqBCyi6d505urVlU9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197781; c=relaxed/simple;
	bh=/pf5mybSf+DizIxpgDclOi0C+qK6dhrOakTgpHQTQsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqp2AWyZcDdaBJAl4RgSyXasBfmND3lf4wIOcWi/etR/0eD4B3FHfOnpfOhiABULl7mc/NpvNT20+fd9V/2E6ayPFloWU4cCvBbrUEGuKsiU8ux3jkKj5ibNFh/0UEme4JA3IxCttvA+rMmDs98+zE4BuOxcIy215Nbv/gaHw6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M/YUuAH3; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M/YUuAH3"
Message-ID: <f7bd2dc1-e7a5-4e80-9cad-2acac8065876@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763197777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfm+MQXULvTpw1aaUw2GJFWd+i9+TwJ4lZKozAzdhws=;
	b=M/YUuAH3IyWhHYn5ZNYhvN1s6M7xHKp63PCRpmUrEKXu53qQ1HuLBjIKdBsHH7i0tHGrO2
	MjXPtZjS13xHfyK5QioHDDtwAUCXkyGqTgTAJkTaZnWGxD0YWfwq7kF4quaoj4fCBUjoDA
	i6LWMMM3rWw68vjk72a2dDN7mW73xXw=
Date: Sat, 15 Nov 2025 17:08:35 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] arc: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Vineet Gupta <vgupta@kernel.org>, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
 dev.jain@arm.com, akpm@linux-foundation.org, david@redhat.com,
 ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <6a4192f5cef3049f123f08cb04ef5cd0179c3281.1763117269.git.zhengqi.arch@bytedance.com>
 <5199c367-aabb-43e7-951e-452657dcdddc@linux.dev>
 <4e120357-6fa3-436a-8474-b07b473381b6@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <4e120357-6fa3-436a-8474-b07b473381b6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 11/15/25 7:10 AM, Vineet Gupta wrote:
> On 11/14/25 03:20, Qi Zheng wrote:
>> Strangely, it seems that only ARC does not define CONFIG_64BIT?
>>
>> Does the ARC architecture support 64-bit? Did I miss something?
> 
> ARC is 32-bit only !

Got it! Will drop this patch in the next version.

Thanks!

> 
> -Vineet

