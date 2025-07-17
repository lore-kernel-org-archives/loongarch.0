Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F351C84BD
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752765184; cv=none; b=daWc5Z+ppIeLsxYALuRKxfHOXkyTZoFDW4NaDNDgRDtHcZyYhi55qm9nY2wxP+ARjtBBHFkaGHENoHscLY7cgvkRycWz0TsuJ5h7TlbRXjJmF2EU2ZBX7AivCso727TbOeW+VFATMJt0wFe564qWu/5aQpSjUP7UcDuvbvuArS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752765184; c=relaxed/simple;
	bh=Mpj7UKAXGClUHCGECxliUtcDd+uw/+26GpVFAnbn+IQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dOoWK7ydaAgyKrEK/aetqorRedpUeWz2B9JP2HOSIaoarjAw940+nwPvsXNGAs85yn4g2nrx5bYOB0YZmG1CQaYWCr7jdWyItSBRC2UwqxzlpLlYR1m0BY5Fe1RmMMBvQahmeFWBzp1OrBUs3dSTu4St0xWGe2ugE9E5e+pTID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrwRwIr5; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrwRwIr5"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-61598534619so512465eaf.2
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752765182; x=1753369982; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O3awApQZB6dc8BKUfAxblHgYrS7r+gffWVbscfIY7CA=;
        b=JrwRwIr5RELfyEEhuvw9qF7WIKaxnGu1BaDopcxIxFRY5H70gNVlzPDmz2CkCfEjBU
         WdMx48wURby3ow4wNKQj5TrfVGro4WyQh4HHrUB8GXoaB2TrM+ORY9xmhIKP6iTB5iua
         nzXcpMYqiQ567i3BaN7cFnDiHPCYfSHGa5eG8Aus20SwkpXjqQtKiFHvHrTg8xl9DFN4
         Iuw/aG13st9+BU1LSWry/EI4q1RA+DjFGUzEhP5IWUVk6QWl+Orr3fC4kDjfN+1bbMly
         QQbF7gF/Acs3nj/GIM1vRYKjNzXR+vw4jMweBQxrS2BVltJmHwlRJoFbmNtJnHG7KOXZ
         OuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765182; x=1753369982;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3awApQZB6dc8BKUfAxblHgYrS7r+gffWVbscfIY7CA=;
        b=W1IZi0ZL8Bbtk60O+XdGT3L8/JRsOobSZfmvJd/AmHhSMk6IWRB2x4PYTIq2iDcAo8
         bHR/057wof9xsgZCxHngxveQdkVjEbH1RSTbx3I9VNZritMchIgFAezpmoEsd0rnJB/l
         F7LP3YMoyJTht/VE3GLYzbuRgj4isfO70djcaGNAiE2FSfnvl9g7iFWDj5wZeMLGvLoK
         6sWRSfIJKp455xA0gai9YhMYch1Fk83WdsIgTBFlDH/siwsW7Q8p8PsBAphq/ios98qE
         CoNJPtqkOJ3ggJN7xt9FAXUK597kr4YLBoWbnPOW4m3uL1s13NiwLX7EPRC7q9/tQsS5
         K98Q==
X-Forwarded-Encrypted: i=1; AJvYcCXilqdFjg/TRN89AyOzNnZHy6z8fjIOGMtc6C6Sjd0KmSNa5LRxNIS+4PQpaBXH76Vn+fZNUAdNC4M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbbhLziztl6UJOwgoivHCVNczcv4vQ5/aZqt1BGJe8who4IA7V
	jCly1tuZ/eyfTnmaAdKvQw4zImh0uqj8K0prVp/hFGHRG0BdmgmFpJI3yTmNW7dJ5tjGdx0EO02
	qR8YXc4tiXcSvlB5qj6TJFoj+oPp5bfE=
X-Gm-Gg: ASbGnctwi7wYhzXdF9TvNSdYgYQlUW04RmC/6VWiqomhy/jzR9B9H+NVVQ3JxyBYl3g
	eWpEQZguBv4wqGZ/mb+8cqstdIRBooOOpMxzPtJKLxrKjUlYQA5kriJLJJ+NJv5yr1chf6+oL+U
	t7HZ8uUmxA5muoYMxDXMJHLSfCjQPRnW1ZfKKybGh/BqjV/PHXcY4C1tE1pEk5+Pb+pCOJVdsYU
	VdeaaI=
X-Google-Smtp-Source: AGHT+IEXpi4bK5GnD7ZsP35qFoSBot5FRm03qGPIRbq9G3i4NdC4YXAdosTTz/QdvhX7GuQXzaXUtzYfG8M+XO/1fkI=
X-Received: by 2002:a05:6820:c087:b0:615:ac59:7613 with SMTP id
 006d021491bc7-615ac59804amr2044420eaf.5.1752765177338; Thu, 17 Jul 2025
 08:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 17 Jul 2025 08:12:46 -0700
X-Gm-Features: Ac12FXwFjMLHAidOb_oFxOFjbV-54BPr5DYym0a8Qr3VcpTRkhlFALqDAsqSU_k
Message-ID: <CAK3+h2z9ByGD5wnk0=C=vML-OTv_22jZr2dn3u1O4Bs5V-YceA@mail.gmail.com>
Subject: loongarch *ip in bpf_arch_text_poke() missing 5 NOP
To: Chenghao Duan <duanchenghao@kylinos.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name, loongarch@lists.linux.dev, 
	guodongtai@kylinos.cn, jianghaoran@kylinos.cn, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi folks,

Open a new email thread to investigate why  *ip passed to
bpf_arch_text_poke() missing 5 NOP. from what I observed, in x86, the
*ip already include 5 NOP when passed to bpf_arch_text_poke(), but in
loongarch, the *ip is missing 5 NOP when passed to bpf_arch_text_poke,
which result in -EFAULT in bpf_arch_text_poke() when memcmp(ip,
old_insns, 5 * 4) in loongarch bpf trampoline patch series. I wonder
if the loongarch bpf jit build_prologue() missed adding 5 NOP? x86_64
emit_prologue() adds 5 NOP, what do you think?

Thanks

Vincent
