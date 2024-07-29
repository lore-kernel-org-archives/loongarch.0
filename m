Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF62B9D2
	for <loongarch@lists.linux.dev>; Mon, 29 Jul 2024 03:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722222223; cv=none; b=K0nKcF1ZN8G8WSxEdlLFkHrnslRSr8FZR2QAhO4R5o107i8iGvnMEfNtNDATuLMLkhBsUcJOoby58gzDCD8GFCp/SwL+XwggwWRvq9rtKR0BdiMnor0JQ5UuNO/6uLRQR0hXK02ufmhRWYfwkfXA+2PzsG7SJPG4E31xeoqkl/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722222223; c=relaxed/simple;
	bh=iyTLuCU18Y/3DWAq8FeUpyOEVu74g6lZH7xKIil/U9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfMrbpIaTMY0kSWtP10oSEhNAtHTomYfjHBk77MEiErpDgIPocTXfhvUHH/I7ImhO7Un0RHODro08hrMRd3yq9Yg0lp+D3H4+T/19I3PkV2FR6vAOodEostf2eaHrFcnqgdckt50Vu8R6Fu97tlEhqZVg18oAMkj6/KH9fjYpk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz13t1722222194t7q1ay
X-QQ-Originating-IP: 1uHf6tV6CXls7qg6zV58CTomlkOggcYwzjNdHAf0UP4=
Received: from [10.20.53.89] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Jul 2024 11:03:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7791691834705649597
Message-ID: <DB945E243D91EB2F+df447e7b-ddd6-459d-9951-d92fcfceb92c@uniontech.com>
Date: Mon, 29 Jul 2024 11:03:11 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: Loongarch: Remove undefined a6 argument comment for
 kvm_hypercall
To: maobibo <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Dandan Zhang <zhangdandan@uniontech.com>, zhaotianrui@loongson.cn,
 kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Wentao Guan <guanwentao@uniontech.com>,
 baimingcong@uniontech.com
References: <6D5128458C9E19E4+20240725134820.55817-1-zhangdandan@uniontech.com>
 <c40854ac-38ef-4781-6c6b-4f74e24f265c@loongson.cn>
 <CAAhV-H5R_kamf=YJ62hb+iFr7Y+cvCaBBrY1rdk_wEEq4+6D_w@mail.gmail.com>
 <a9245b66-be6e-7211-49dd-a9a2d23ec2cf@loongson.cn>
 <CAAhV-H7Op_W0B7d4uQQVU_BEkpyQmwf9TCxQA9bYx3=JrQZ8pg@mail.gmail.com>
 <9bad6e47-dac5-82d2-1828-57df3ec840f8@loongson.cn>
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
In-Reply-To: <9bad6e47-dac5-82d2-1828-57df3ec840f8@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Hi Bibo and Huacai,


Ah... tell me you two aren't arguing, right?


Both of you are working towards the same goal—making the upstream

code for the Loongarch architecture as clean and elegant as possible.

If it's just a disagreement about how to handle this small patch,

there's no need to make things complicated.


As a partner of yours and a community developer passionate about

Loongson CPU, I'd much rather see you two working together

harmoniously than complaining about each other's work. I have full

confidence in Bibo's judgment on the direction of KVM for Loongarch,

and I also believe that Huacai, as the Loongarch maintainer, has always

been fulfilling his responsibilities.


You are both excellent Linux developers. That's all.


To be specific about the controversy caused by this particular commit,

I think the root cause is that the KVM documentation for Loongarch

hasn't been upstreamed. In my opinion, the documentation seems

ready to be upstreamed. If you're all busy with more important work,

I can take the time to submit them and provide a Chinese translation.


If this is feasible, it would be better to merge this commit after that.


Best wishes,


--

WangYuli


