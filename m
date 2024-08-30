Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A213665B
	for <loongarch@lists.linux.dev>; Fri, 30 Aug 2024 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005328; cv=none; b=o5aAdPq/3a8QSiUnGuNFSXZ/MueBbrXjKxqsWnYe8G/bpDwf9q39Vwa/WojjTo57p4g60PWHzxbLOc8j9pF/gxO6or4J7J/vRYDj9KfseU4lvP4dwjBkqUSvlzA781cILqcLUgBPO4zSmi3MdE+rHuBQVba9eh9+0i+BB2I6wWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005328; c=relaxed/simple;
	bh=Jy/mYLXULjxw7bWxF1qLAX0cl4bZqglXQz03uA7r4aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOFCupamxgEmQ2cy1oOV5bK3Pmccad1IA3O3rmWfhjjI12j9O9b1Liu1grjE5Nvl2MseesSyWIzV6yQVzO6zZuW79RBiK0tNeZx+4qe8CE+B+9ZEOhcXOylGeuL4jZnyCpwNp427tiiq+XDKw4UlIMizScoE/FZM0tu/vVpX6f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=n95xtmHg; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="n95xtmHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725005282;
	bh=qPQeX9heYTsZA7PiEdNYwSS+6KBwti6b7zQjuWjxDE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=n95xtmHgnXUR8k7ESRCsCMsHpy9iDs7iPi4DulS2pl5P3OU5r/hzuaq7ivYgY90GQ
	 /DwACF98vqFXx4sXdtOu61hL4kNpx7lJigJDjyVm3NmWz1e/Nh2KDE3fMMyKYU/KHr
	 8Xz3Oa4Gv0p+bJ/sGK0Vz6sT6vgpe5s9moCk4wR4=
X-QQ-mid: bizesmtpsz14t1725005279tbqo86
X-QQ-Originating-IP: fLqRLMABWHnhxJr0BDqDta1vbYiDrEnnlwy8FrCYQD8=
Received: from [10.20.53.89] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Aug 2024 16:07:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5593259827652918070
Message-ID: <4C6AD88A4E46420F+7823bff3-8421-4746-b34d-5bdbb1bfe247@uniontech.com>
Date: Fri, 30 Aug 2024 16:07:56 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Loongarch: KVM: Add KVM hypercalls documentation for
 LoongArch
To: YanTeng Si <si.yanteng@linux.dev>,
 Dandan Zhang <zhangdandan@uniontech.com>, pbonzini@redhat.com,
 corbet@lwn.net, zhaotianrui@loongson.cn, maobibo@loongson.cn,
 chenhuacai@kernel.org, zenghui.yu@linux.dev
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, baimingcong@uniontech.com,
 Xianglai Li <lixianglai@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>
References: <4769C036576F8816+20240828045950.3484113-1-zhangdandan@uniontech.com>
 <aa72bc73-b20d-4652-be89-37d01f291725@linux.dev>
 <6B877E46C55A8A27+f98078be-8cde-46d2-9065-3f12e44ac603@uniontech.com>
 <6da89601-35d8-44cf-88e7-db8f36635c66@linux.dev>
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <6da89601-35d8-44cf-88e7-db8f36635c66@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On 2024/8/30 13:48, YanTeng Si wrote:

>
> BTW, I've noticed that v2 is still a work in progress, so please 
> reduce the frequency of sending emails until the v2 and v3 reviews are 
> over.
>
>
In fact, the issues identified by zenghui.yu in v2 have been rectified 
in v3.

To ensure ongoing optimization,we kindly request that 
huacai,bibo,zenghui,and any other relevant parties provide feedback 
directly on v3.

> Thanks,
> Yanteng
>
>
-- 
WangYuli
