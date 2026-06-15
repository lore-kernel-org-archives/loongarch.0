Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB0404BE5
	for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538333; cv=none; b=IWxoBVNDShYw7zYPuq42asqqI23E04a8JflDaMZsia0kzJcs6aRPO4ViosI+b/Shvdf8zGqrd1CSE9dlTiB3WpvgrBY9ZE2P2s8iyRkIxlFajMKnMEuUYKdmynjmbhYFs81NXNgzwuAZomYmu1OKsLCcwOeTYHQ/GIP4AVhDOL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538333; c=relaxed/simple;
	bh=QqoAvbiyQQgUhV16qDYAHCAa0swk4FHa96i9AC8gypc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ns7x4MEEZTUVoaXUB+kL/OZYT5QOfeZQryMXInQdenWR8mzo54OK7IyPC2MUTQxF+UOFlNntJ/Es4LPNnJBYTa8Rg+t8+Y4iWePpsjMQd2cz/6254scK7J/3S0CuZxmeOVssKb/eqbNDVyedOo35wwWaDBzNpsIdWe0wo/aziBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gO9MaIQW; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gO9MaIQW"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-43d08bc82deso3448265fac.3
        for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538330; x=1782143130; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqoAvbiyQQgUhV16qDYAHCAa0swk4FHa96i9AC8gypc=;
        b=gO9MaIQWyi8wW0GmlskQsSVodIQqZhYR3S+JowI+1G/Gbkps6qcwBBlgiqzfRcP1At
         axCj6A5Wse9QjyzErJVYS8Rs0Yey9a0+pqDfBQsnpcd5beQMcrzuqhFr5CX/SXRQGBq2
         /WtreYFesD2Q9NDYMHH6YqMoUlyfY/Jpe5F8wx+0MFqpJ9vWp12uiDJmVogHckvyumqj
         jaeaZMUTKwr3A8R/a0LEoF5nrpigBMk9mdE1Af2W8f84vVCZRKALQWWCcKOa5mnoBM2G
         33ZzqV2lGGQZ641V53o8BtfzylWXkWQfnIKdFIk6ih6IF2+clyXzJXF31g0kN4h2ErdS
         x3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538330; x=1782143130;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqoAvbiyQQgUhV16qDYAHCAa0swk4FHa96i9AC8gypc=;
        b=d1GYAv7ICXGgr+x4tzf6+NBSwYZJU8HN/J5KzCH1AobBUltKHZqXpLSQF16yZjX+Ts
         eENoXjeT3JMtQ2akqtfoa1J84zTjqGY9X9g0stLOD9y7yzsjE7fj/Vs/PQ4z7+oQ38nR
         XZevOGsJ4HrCfvsbUdmfy+kIyRAWZtE8jd5IPktUsXJ+21F+DcpdE39VmORd0MbaWr+9
         eGaY9uEFb4itV9eR5FPIu5vaRJKPJrghhJnLU6mAOBU8aoXOaIljxrBfJtFYH0A9mzK0
         ul5sgryidl8LXv10bukxYdjR7go/Sb6pUKKj6mxdkZBOHlf+zuFIb9xbuLj64S73deR0
         +j+w==
X-Gm-Message-State: AOJu0YxqLotPNHyZe+b0RsnL5g82huJe4eNu+1yK0QihdB59iQSNIpVG
	MxtyBX4im20HT/BRE+iPA8Jih3c/DCs3CCDOfZRmkzhDoDBfih9YWonksAAZLw==
X-Gm-Gg: Acq92OFvMbcoFV0nVKkugFfBTXFvD/tlQ0qzhvHUG2GjDQooW0H31qDKP0NkhhDTlHX
	NLFNSVNQgOz7eYabwFpOqNLvf3K/BoLN+JNxDc+/Bd6Tl0m5dwOQwBVosQBslmob0ZwmELtwpr2
	mNisEZ6rSnlyvxVaW+wi75UoNykpHQcvXnpHqal//nIq7WuhzPALYtBJYF62pCzlfj0e/YoLHbq
	Agj9ZqAvHe3YKDKELmbzmCDqqR0DDX4tMMs607+LIH4Rbp2DXhx0W7xgcALAjax1h3UmO4Oz87j
	26qKkqO1U3dyRzKDmuplEv6oev66WPWabJ8MT+99cVc9mmWvO1UamkFwYCqhT7GFu0gWgcxOujE
	nHiPW18dR3U2iiUhvseiJgwGTl23OOeCBlW11bn8gNp7BA9z0d5BZwHdDW5OX9ds34I+wF22vkn
	4pE9PqnwjY38o+K26/jV04EmXJx3itzBnl+5K4zoJXidqEXocONwBU/ywDrZ1dRgANil513jliD
	E+4Ptgu4c5HdPLWv+hD8VG8dovc
X-Received: by 2002:a05:6820:f00e:b0:69e:5175:de1 with SMTP id 006d021491bc7-69edc76c580mr9255765eaf.41.1781538329976;
        Mon, 15 Jun 2026 08:45:29 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:54::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44308afc5a5sm137996fac.5.2026.06.15.08.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 08:45:28 -0700
Message-Id: <DJ9QMPLAXOGG.2PDC3A2MUENPC@gmail.com>
Subject: Re: [PATCH bpf-next v2 0/4] selftests/bpf: Add some tests for
 LoongArch
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>
Cc: <loongarch@lists.linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260615100506.19558-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260615100506.19558-1-yangtiezhu@loongson.cn>

On Mon Jun 15, 2026 at 3:05 AM PDT, Tiezhu Yang wrote:
> This series is based on the latest master branch of bpf-next tree.
> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/
>
> Dependency Note:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This series strictly depends on the following LoongArch core series,
> which moves thread_info into task_struct:
>
> "Move thread_info into task_struct for LoongArch"
> https://lore.kernel.org/loongarch/20260612011616.27771-1-yangtiezhu@loong=
son.cn/

Pls repost when this patch appears in bpf-next.

pw-bot: cr
