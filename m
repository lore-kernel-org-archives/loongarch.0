Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9A082D94
	for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 06:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722405927; cv=none; b=lS5v23MKzy1yLHTMt8N+K4MU5C3cjIiwnRO/GxJ3ho/R9xIbeG82HtbXaBXPBl+hur+Wdq7sC+rhGFABS8Su6XjmKo80iOfQnyTZ1zR4Kke29xZzYwUowotT8vJq4qEnZKui4qyycH7L7OtY+nEMV3n1F2zrk2djLfPFp6VsR1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722405927; c=relaxed/simple;
	bh=Jfb32fmoRBah5K/TRzqKuphLtVvEUwuBjg8gll079nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdn+NhOHQ83SoDZBu9VmqJDpO5qba/bjsvxpnrceX5pKLuc9fXLSqZSE4Wl2TzkOwKbaruc1B4jNDQB/SSXtCzXMbI2+laMREA9cY3to607HZriJfuAqhqBmXBexjrCCdTD1yqO+oXyYkrxc5RfkIMD025yOFWaRkjski4rZQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz5t1722405905t75b0b9
X-QQ-Originating-IP: L8zPWYoYF9HeaiXZZoV5vVP/gC34wDkDtF9OHuW+rCU=
Received: from [10.20.53.89] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 31 Jul 2024 14:05:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9183415464002977856
Message-ID: <922714F826930E40+48e8f174-ed9d-4fc6-8227-28bdfff0fda2@uniontech.com>
Date: Wed, 31 Jul 2024 14:05:03 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: Loongarch: Remove undefined a6 argument comment for
 kvm_hypercall
To: Dandan Zhang <zhangdandan@uniontech.com>, zhaotianrui@loongson.cn,
 maobibo@loongson.cn, chenhuacai@kernel.org, kernel@xen0n.name
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Wentao Guan <guanwentao@uniontech.com>
References: <6D5128458C9E19E4+20240725134820.55817-1-zhangdandan@uniontech.com>
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
In-Reply-To: <6D5128458C9E19E4+20240725134820.55817-1-zhangdandan@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Hi all,


The English documentation for LoongArch KVM has been submitted.


Link: 
https://lore.kernel.org/all/04DAF94279B88A3F+20240731055755.84082-1-wangyuli@uniontech.com/

To ensure consistency,I have observed that a complete Chinese

translation of the KVM subsystem is currently absent from the kernel.


Consequently,I will undertake the translation of the entire subsystem

prior to incorporating the LoongArch KVM-specific documentation.


This process may require some time,but I will endeavor to complete

it as expeditiously as possible.


Best wishes,

-- 
WangYuli*
*

