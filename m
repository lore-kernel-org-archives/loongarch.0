Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1850B187FEC
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753955162; cv=none; b=YKVHZGCpxnJPyH3CO2oXJSd7ZPlxbngiwdivmW+t+jHTsQwMADkn+vO2hTTK8wp4nu70EN/EcE3dMDzxtB2FOP/cFMUzEpVz/MRrYLQ0nM94fj+QGYyVV3q32QBkuq2lqqeLaKSkEQ9UwtSxZFvInKOHRQQ5304MZIjZgr9F0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753955162; c=relaxed/simple;
	bh=uEG7vPwYLQv7+Cue9ZWWOxMjQqafe3uVJU7R6AySpNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JD6KZw0r2s0YeJhEnXKHbgGWsy5tCEtwNnhWbXyzY+Npz26Q0tQ8oQ17EoqyB4Lepf4iCbGfnhVZCVjbxgLVHpCfb+b/qJ731UGdZW6Bp+4N+cRnB1TVTsmpLFZm1tJxTDnF9kh3GjAGr89BpVYfsZgx/+76zLh3sh6DUT9A9ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sLhHZEW8; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sLhHZEW8"
Message-ID: <c6cfc254-9cde-4b9c-9126-1144fdece7c6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753955156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWuNqdtjYQOErQoAJ2sGFU3TBdHfvq1Q3mLRhSIkbO8=;
	b=sLhHZEW8vLNqqEQUy7SNmRpt2VMmSr3cGrdVyLBGQIw/j6kkDKTTccm30p/NJuYGs1NDMu
	FtSBsCGKhjbM3rttO1mXexf9BDlhOVXJffyH8gG0eIdC9zybgDn1YMYx1aFwynT/Sp0gfs
	yQILs23bOigXKcioFoD+qq0yHdt/8Qk=
Date: Thu, 31 Jul 2025 17:45:49 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Re:[PATCH] LoongArch: CSR: Complete KSave registers definition
To: Wentao Guan <guanwentao@uniontech.com>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, chenhuacai <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, "jiaxun.yang" <jiaxun.yang@flygoat.com>,
 yijun <yijun@loongson.cn>, loongarch <loongarch@lists.linux.dev>
References: <20250725103624.69247-1-siyanteng@cqsoftware.com.cn>
 <tencent_561EDC7155FE49AB4553AF12@qq.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <tencent_561EDC7155FE49AB4553AF12@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 7/31/25 5:30 PM, Wentao Guan 写道:
> Hello Yanteng:
> 
> As the manual say below,
> "The minimum number of data save registers is 1, and the maximum number is 16."
> I search the prefix pattern "LOONGARCH_CSR_KS" in v6.16 kernel source,
> the KS0-KS7 has been used, if hardware support it, add it look ok.
> <By the way, the KS8 defined is strange, it defined but not used, i don`t know why.>
> 
> Note that as manual v1.10 v4.2.1 say:
> "When a CSR access instruction accesses a CSR that
> is not defined in the architecture or not implemented in hardware,
> the read operation returns an all 0 values and
> the write operation does not modify any software-visible state of the processor."
I understand your concern. Actually, we can obtain it
from CSR.PRCFG1.SAVENum, which is clearly stated in the manual.


> Reviewed-by: Wentao Guan <guanwentao@uniontech.com>

Thanks for your review!


Thanks,
Yanteng

> 
> BRs
> Wentao Guan

