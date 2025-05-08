Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39FE8472
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682978; cv=none; b=MEQc7u758L9xjRmrkdB0jNBn8gkuATYAxmT/N4K/tBAGObGSpBIrjEzCcJB5NnALOlzqhrGHxFJIMY65+9GOT4iAntZfUD61vNT8tHw5qbLiFsMSRYpXZbWsnDydDk5fbRW2t3ByGl47f9PRW5pe8JcnKjIceryTyem/LV8ZQVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682978; c=relaxed/simple;
	bh=lC0+8NbFgtH8XRsCLDv/b332FQ8+tZ9gWbtCOaO79WA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rB9UoPqbLYgQ9HunlaRZ51DdWnuXkcYuBR+25t52fJG8/jqx62HyTn3NsmBlsalTVV42U+zm/7CNghqhJmcB+Rmu8ENb1wmdvJSV7D3JtUxBqU9qdRDaMAndXp26gi2gzx4K/FB6lesa/5V/FuJS1ePOvwjKZLde36+bhYWHjGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=op5/n+sO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="op5/n+sO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7FCC4CEE8;
	Thu,  8 May 2025 05:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746682977;
	bh=lC0+8NbFgtH8XRsCLDv/b332FQ8+tZ9gWbtCOaO79WA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=op5/n+sOaDNI1sOMh9BJ3HE+YtWwfraW440ue8yK7NIp7utnDMQH6eaCNrbrgGdeO
	 M2sM3gLS2aLwcefKU0QbM7zvu5q1lk/AAaA61tgupw/vSkzOrHJ9goqNhgJx1dhPSH
	 tIwdUv13OgcxV0ytbSzujoi/wLBh21op+d4LsenU=
Date: Wed, 7 May 2025 22:42:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yanteng Si <si.yanteng@linux.dev>
Cc: george <dongtai.guo@linux.dev>, chenhuacai@kernel.org,
 kernel@xen0n.name, rppt@kernel.org, dave.hansen@linux.intel.com,
 geert@linux-m68k.org, ptesarik@suse.com, guoweikang.kernel@gmail.com,
 maobibo@loongson.cn, loongarch@lists.linux.dev, George Guo
 <guodongtai@kylinos.cn>
Subject: Re: [PATCH 1/1] LoongArch: mm: remove redundant pte occupancy check
 in __set_fixmap()
Message-Id: <20250507224256.f0024e8daae3eea64509a351@linux-foundation.org>
In-Reply-To: <ca0a9d8d-9a89-4727-9b4d-732f716b80fc@linux.dev>
References: <20250508030506.7076-1-dongtai.guo@linux.dev>
	<ca0a9d8d-9a89-4727-9b4d-732f716b80fc@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 8 May 2025 13:23:38 +0800 Yanteng Si <si.yanteng@linux.dev> wrote:

> 在 5/8/25 11:05 AM, george 写道:
> > From: George Guo <guodongtai@kylinos.cn>
> This is unnecessary. Please remove it.

Why?

I believe it is necessary.  Without this line, the patch will be
committed as

	From: george <dongtai.guo@linux.dev>

- different display name
- different email address
- email address doesn't match signed-off-by

