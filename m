Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE468BE3
	for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 12:27:30 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31765792c7cso243687f8f.0
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690201648; x=1690806448;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWM93a9xu6qm4bqV/ft0sQuj37BqnW4nnz/nyihWvyk=;
        b=qO7HYU0kl3lmlv91vLm2frzUvgIIcr/xv62HYg7vRMOsA1rTV4UhDhHJJNY/UNXSk7
         Oyi+xR1ONajaFHBdjsY59qfuIrsEDNEAazUdOxkHqpwgo3S6YmmTHrQWTyxnxNnc+g0L
         hFn0Rg8R+Dmahmdg6llDxzFXBoN3nYT+gE4DJ+XpEM0kPFc1g0Ybnf7JInOg5vigE1Hh
         DVbpXQt9I5Eamy1WuJUut768365Of4jeJsu9Qt0MGPqPA2ANeTZ2lJo9aeECHfhGhjK8
         qLZjtzNdhWHcOLrYRMTzYuHl18I5nhOawkZPfqJwB2ekPZWV8gkwdLtkLJMKIAqBB3sB
         3bDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690201648; x=1690806448;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWM93a9xu6qm4bqV/ft0sQuj37BqnW4nnz/nyihWvyk=;
        b=JzgfGUi4BhgDFqA/6SsWo8nlU+bZToGKICFXXEMZcAX1MZ38IZAAHpRyeTi/r38u5k
         AFECvismjgUS90qCh2tRV8ufRoFXCcjRzlV899zwMr4RDKXTOCwo3miVM3QI3QZwLyZp
         H8WE0Ep/pd4z0oP4FeuSVaFPOIWQeFDxiB19PTIKT5tjef0sgwGPAHgy2nYVrfZyRDzE
         AieKWPG22Ihjn+RWLjt/mEm6Lhujkffm886kaJ8XdC4rXrgPphqjG1Prn17yDygC8mIu
         zw9rlW75VtpTg3vVK5gBHIdzGp/r/yl5HIkHfL6gV+ZIPLGgf51AVSXSY5DEwnNVUA+6
         G9rQ==
X-Gm-Message-State: ABy/qLanhIk5rI3bfK5XJi6uS0FcaB91MeaTok7DiJA1BiNDwO5HJRNI
	8qHvBrM8hRZXBgpHn9Nppco=
X-Google-Smtp-Source: APBJJlFfX4JupHVdcocdDdxAtai6IVeZqCcBHiRZQ08wzVfXyG/pYCDFjufiN62ne4tPmWbdTZmFdA==
X-Received: by 2002:a5d:69c3:0:b0:315:96ca:dcab with SMTP id s3-20020a5d69c3000000b0031596cadcabmr8418583wrw.35.1690201648414;
        Mon, 24 Jul 2023 05:27:28 -0700 (PDT)
Received: from [192.168.0.101] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id n8-20020adfe348000000b00315af025098sm12840340wrj.46.2023.07.24.05.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:27:27 -0700 (PDT)
Message-ID: <bcf97046-e336-712a-ac68-7fd194f2953e@gmail.com>
Date: Mon, 24 Jul 2023 13:27:26 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Youling Tang <tangyouling@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev,
 "bpf@vger.kernel.org >> bpf" <bpf@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: re: LoongArch: Add BPF JIT support
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Static analysis with clang scan build on arch/loongarch/net/bpf_jit.h 
has detected a potential issue with the following commit:

commit 5dc615520c4dfb358245680f1904bad61116648e
Author: Tiezhu Yang <yangtiezhu@loongson.cn>
Date:   Wed Oct 12 16:36:20 2022 +0800

     LoongArch: Add BPF JIT support

This issue is as follows:

arch/loongarch/net/bpf_jit.h:153:23: warning: Logical disjunction always 
evaluates to true: imm_51_31 != 0 || imm_51_31 != 0x1fffff. 
[incorrectLogicOperator]
    if (imm_51_31 != 0 || imm_51_31 != 0x1fffff) {


The statement seems to be always true. I suspect it should it be instead:

    if (imm_51_31 != 0 && imm_51_31 != 0x1fffff) {

regards,

Colin
