Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817D2A1CF
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779850957; cv=none; b=L2HVzdcbjT++WORQnXodQysSLWGi18FO7IhzQa5HAPz/+J70zlvlE2jYJ9yBOc25V/9loc5KKaXrd3xCXiGLXwFh564UPVrplzHb6UCO236b4DOIUlS5xO/jlDUUJYJwWksPsocsYkDSRR+L1dUxT5x09PsrUKdjmreAJ7UaN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779850957; c=relaxed/simple;
	bh=PqmLx2t5A+RRW/DOiJzSpQ36CSpIg49gNaJlu1U63J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIr3/j+aU8xtkW1HHllSqHQDGJOkC+N8weJaclveRoSJrCxp4fmcGLkZ+wnvf26AbH5FZZilzAniOmx5z6O37gcKWpzxjrqchB3TyRWatW/6k87RBnWG5IT50Ix4vZUSi8Pxp0vdcAaRhtS5EGHBJOuv8EaDTCgugwopAtvZFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7f7cb688597811f1aa26b74ffac11d73-20260527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:56499a75-40b1-47b5-a90a-6ca238cca28f,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:56499a75-40b1-47b5-a90a-6ca238cca28f,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:bacc75449350024623fdb0308693f594,BulkI
	D:260526202600LHL4CQFH,BulkQuantity:2,Recheck:0,SF:17|19|38|64|66|78|80|81
	|82|83|101|102|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,F
	ile:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7f7cb688597811f1aa26b74ffac11d73-20260527
X-User: cuitao@kylinos.cn
Received: from [192.168.108.130] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 875547290; Wed, 27 May 2026 11:02:29 +0800
Message-ID: <db3f9608-5b4c-4a06-95a8-096caefe70c6@kylinos.cn>
Date: Wed, 27 May 2026 11:02:25 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] LoongArch: KVM: Add PV TLB flush support via
 steal-time shared memory
To: Bibo Mao <maobibo@loongson.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name
References: <20260526111837.2090768-1-cuitao@kylinos.cn>
 <20260526111837.2090768-3-cuitao@kylinos.cn>
 <0cb0ee14-39fb-8814-7230-788071486760@loongson.cn>
From: Tao Cui <cuitao@kylinos.cn>
In-Reply-To: <0cb0ee14-39fb-8814-7230-788071486760@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bibo,

Thank you for the detailed review. Both issues you pointed out are real.

On the host side, unsafe_get_user + unsafe_put_user is not atomic, 
which leaves a race window with the guest's try_cmpxchg. 
Also, unsafe_put_user failure would skip the TLB flush entirely.

On the guest side, the two separate READ_ONCE calls have a TOCTOU race, 
and byte-sized cmpxchg is slow on some LoongArch platforms.

Fixing these properly will take some time. I'll work on it and send a v2.

Thanks again!

---
Tao

在 2026/5/26 20:22, Bibo Mao 写道:
> is it possible that unsafe_put_user() will go to out sentence and skip the following flush tlb? even if value of preempted is KVM_VCPU_FLUSH_TLB | KVM_VCPU_PREEMPTED.
> 
> On guest side, try_cmpxchg() atomic instruction is used, however here is non-atomic put_user instruction.
> 
> Regards
> Bibo Mao
