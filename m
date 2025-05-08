Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8484215F4B
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683813; cv=none; b=bTtEzS3iKXNGVUH6BnoQtvoiIJJch3bzSeX9tlQzvlg9oML1d6pN4U5jvPuzMEQT7Z8dPpqz5Lh8o/jCmRL+cPlsxFsNp8LL9c9NWZfvoDW+AyxmS+luUCm7cPy+CuZZ1c4eVg5TvrETk/BuH8Jec0JbcRXadj5g1VovI+HjMeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683813; c=relaxed/simple;
	bh=oZwep+6AfiIxCMkZ30qJpx8Su/kbHeZxM7+y/hZ/FQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sl29D1OaUk6Gd24wImlFEzvUuR4gu6erxpq65UyfBoDZX6p2Fp2aOwqA0UcC6ZHe9QubH3ktnwappcbKtwwoTaP8B2QTl44p7zjooxIbJTZvZQePjnAxHb1XyWwSfjD8db79hB32emh0SesBXrJBRkCrj6lMCyOIDz9RZStlX4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LsmTeqz8; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LsmTeqz8"
Message-ID: <fc44a640-06cb-4060-80c9-33e97fa2543e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746683808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZR/lPdAasENtLcAro5Bj0XXXavJPQ53exgocFjkORo=;
	b=LsmTeqz8lIYHh1veLC3vBQY4YxQjzo+r7sOA5A76+LXuzldR/xW5hK4ftg3CK0Nf31Jh4C
	JTdNhkRCcNFk2hci6sW4QqnQq1JYTgPS07RWTrhQVv16VyeqCugvcIAVMmVhhOmbUnBxQj
	/wHbPiio2xOBSXT0MZW8JTcFQALIMNg=
Date: Thu, 8 May 2025 13:56:20 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] LoongArch: mm: remove redundant pte occupancy check
 in __set_fixmap()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: george <dongtai.guo@linux.dev>, chenhuacai@kernel.org, kernel@xen0n.name,
 rppt@kernel.org, dave.hansen@linux.intel.com, geert@linux-m68k.org,
 ptesarik@suse.com, guoweikang.kernel@gmail.com, maobibo@loongson.cn,
 loongarch@lists.linux.dev, George Guo <guodongtai@kylinos.cn>
References: <20250508030506.7076-1-dongtai.guo@linux.dev>
 <ca0a9d8d-9a89-4727-9b4d-732f716b80fc@linux.dev>
 <20250507224256.f0024e8daae3eea64509a351@linux-foundation.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250507224256.f0024e8daae3eea64509a351@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/8/25 1:42 PM, Andrew Morton 写道:
> On Thu, 8 May 2025 13:23:38 +0800 Yanteng Si <si.yanteng@linux.dev> wrote:
> 
>> 在 5/8/25 11:05 AM, george 写道:
>>> From: George Guo <guodongtai@kylinos.cn>
>> This is unnecessary. Please remove it.
> 
> Why?
> 
> I believe it is necessary.  Without this line, the patch will be
> committed as
> 
> 	From: george <dongtai.guo@linux.dev>
> 
> - different display name
> - different email address
> - email address doesn't match signed-off-by
> 
OK, I see. It is necessary.

Thanks,
Yanteng
