Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795831894;
	b=sBizeAbZ7XUgC9+izG1NAcyxK0e7Eq2ll3rV7fFAwvpVK1VZM5zEaXTOHred/Fyyv/6A
	 nCmjDTUQSI0aHzOxWVb82xj0LFvTStsRdCgp5lpK0o2RySNSC9VzGdYDNWCzFW7QaLAtP
	 C1ibsSP4PMGrtmKT9Ak7I7phtrbrZT/0E8k8AhedJV4gPXvbULwQMMsmbRZPsEHlB0UXr
	 dnzaS5mjV8bNNaVmsYhOaJA+PSfPXZTZQgUKKwJu7fNmXMaH05zk3f2FNyQH0uOyHNxT1
	 rnIKLfM9oHP78WCbdbDU0gQSx50HJ8QAaSpmv0cZ8mJAVFNpZsAC0QyHl/Flz9Hp4rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795831894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=lRwGlaj5RwO6TN822KL2cVnT+xTwV0jhfhAp928m0Do=;
	b=eQfCKGgfSVn8OMTLUZACYh80ff5OmQspC85as1Sgp9p0ek4QKmbliSC/fYnym1tqq+EA
	 mXVIsMJzQqgjMUS2z75agLrjBWgDIcwuqXkFHXaIMUe85xQ4trv05lp6VgPxv5AXla+8s
	 rPJonXJv6R+k8/HC8ns3QQ3RyYr0oljo5rMLhpWfCosMqJlGHDTdJe6NXHiq69JE0+3zj
	 POGiSn4UDNXsrcdFDPVPplw1f3bHiZ0iLsmp/2rxJnkW+/e+/PLFwQvAhyIzj8SEcCbA2
	 GieSL3Hkx4D2CKt3VLphAdhV8F/MGNniyRqUj3kMcvj9n06vbw+30Jn274DfaBB+Wag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rb7Mwyfv;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DFE606A31E
	for <loongarch@lists.linux.dev>; Sat, 28 Nov 2026 02:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rb7Mwyfv
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b546061d58so20257058c88.1
        for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 18:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795831893; x=1796436693; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRwGlaj5RwO6TN822KL2cVnT+xTwV0jhfhAp928m0Do=;
        b=Rb7MwyfveJD/ZYpR15osSYVKAwcv0j76/tlovGsEV/EDG/JZkerXqUpOPigNg6z08v
         GUoOIkRMhMQbV1+qVUFEqdYhe4ZN1CQb6j+rrmeE/7QZ1WdDlWzFJlN6ZVFTnZVYdArK
         Kxteh11vRlgZBN6kSq8e/inF5doYFB5s2AtZPxMn7RHb82vakuAZShP5o6m1SRYWYzip
         ztJ0R/glF4BT0G2VwQTMysnc0U0DagwpzBns/2E2apazxA/IRk8B1SUu+V1xwvslfukY
         tGrO55HEPC27IyeMZJO9Oj4OUWHRC19OTx64BO8o87MHFPnfk5/Mbv5dG9+kN5nMXM31
         dyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795831893; x=1796436693;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRwGlaj5RwO6TN822KL2cVnT+xTwV0jhfhAp928m0Do=;
        b=iA5j2H5MbHxVIp4FF+Nc0aJOs7A5B2o6QjpI8YppsFoUZaxX2y1y8gM7Jy6vwBB+IJ
         LND3MrNuC9IUNuhF1T3oMh1N++6ySzXCjrIZNcpn+QFbJqdRn5y0zy8OrkV2Zua2cmAI
         mvKMjkLnN7vPWo/oKeJ8o1JdgO5PCzMJMakcHHWeETFFZ3+RxsT2h83uE3PV87Aw5H57
         IaTKh/iZ+vaDYsCehh8VQ2Y+/Mt7cRkVXJ3ORfUwxmRRcl2Xv1DLf4oAh101xF3B0soR
         GKM7FEIXga7IyNec21P449Nb0EsW1iRwa7ljEV9FO+sVNNqkk3k5q6ovq2j2Y4nZDDjb
         B2hw==
X-Forwarded-Encrypted: i=1; AL+hErGHYMpTkgQzqO+W9xtGXHOiFH3dCO6p1mFVWnk8ZKsD0ubnMwf6s4noNGC05Z3BCkHXqJ0QEGEN7u4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/J1e2liw0guNca01HWvP/0Zav4Oi1jWmDzG/3srqaUqZJhW615
	916grkviQjRWqZmIgGExBP9BAThsklGvzpEE7pnGkJjTbSR19iAfbZjP
X-Gm-Gg: AZFdTZdYiXxP56i4BmsaPkmFPrNXaUkpJQ0XY1TK0Dfo+gsgXnNNTBkPsquNqdE/EgR
	B5SZbexjUO4FJlyMijhZUas+67xyoBMDlmRsKqrI2adnJKmqLHAddP4MkWYsFqtcNEeCIFNBAMA
	TScXiklR9vQ6GpnPMFvpUm6Krk/sTx6SJ0RW/CWPE9+1jlLfcHO51jtW+AEK5vUYEqwnB3357dp
	daI62rKlnJvb6tKnnfP/F0m3kh+PqfqLHDOgxeNmLuq772ukZvCBFAclxhw4DigyRKZwWKtr0kF
	EbiymP+kWPQutuGI1d6wPw4j4Ze2cpx3R8cCqE7u0Nw9IyCGrpjzlZkOJYRyAigUmwtoVHzV/0x
	01KHvVQfsXSorm0R3AMtOaoenmFtA/DC4+HGjFh0A9LP6HO+adAxJqy6dj+TFNIyUNsI+9SyjTL
	xcqzfVdAvrOJfN3CCKoeuItPHaTajF3yAlOMGKh+OJJrd5TpApDmVqjh0eetnC8oRZW8tZPwVYZ
	BhGjCnIakP1GoRXFGA/g1pQibMjCVk5Jpo/VmUzMyEq0HjXmvctwkgkqkRbbBPyFTnxA9t1GPmZ
	+uCjuOyZ8j29cDvaTRBpKXik98f2UA==
X-Received: by 2002:a05:701b:428a:20b0:1b5:1a0d:b544 with SMTP id a92af1059eb24-1b5568a145bmr27910210c88.7.1795831892972;
        Fri, 27 Nov 2026 18:11:32 -0800 (PST)
Received: from wg-vpn-sf2 ([138.197.218.192])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm58251459c88.3.2026.11.27.18.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:11:32 -0800 (PST)
From: Vincent Li <vincent.mc.li@gmail.com>
X-Google-Original-From: Vincent Li <root@gmail.com>
Date: Sat, 28 Nov 2026 02:11:31 +0000 (UTC)
To: George Guo <dongtai.guo@linux.dev>
cc: vincent.mc.li@gmail.com, loongarch@lists.linux.dev, yangtiezhu@loongson.cn, 
    hengqi.chen@gmail.com, chenhuacai@loongson.cn
Subject: Re: Teaching LoongArch BPF to Fail Any Kernel Function
In-Reply-To: <20261127045734.4276-1-dongtai.guo@linux.dev>
Message-ID: <e97a09b-99ca-4768-594a-35ee4f6a10fb@gmail.com>
References: <c5f9ff8-ecec-e033-a1d8-4fb53392c41f@gmail.com> <20261127045734.4276-1-dongtai.guo@linux.dev>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII



On Fri, 27 Nov 2026, George Guo wrote:

> Hi Vincent,
>
> On 2026/11/27 10:25, Vincent Li wrote:
>> FYI, this feature seems cool to have for loongarch.
>> https://lore.kernel.org/bpf/20261114051805.683966-1-alexei.starovoitov@gmail.com/
>
> Thanks for sharing. This looks interesting. I'd like to look into the
> series and see what it would take to support it on LoongArch.

Hi George,

Thanks for showing the interest, this is part of the background technology 
that the open source project shirudo is building, using AI to deploy BPF 
at scale to mitigate security bugs.

https://docs.shirudo.dev/concepts/background/fmod-ret.html

>
> Thanks,
> George
>
