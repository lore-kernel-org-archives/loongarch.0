Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9C42050
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768068296; cv=none; b=a2tEARnOK86JJe42wFbKE6XY6LbE8wx83ACaffKaH0mog16PjaXTa7jVTu9MoBp7wUJlbL0XymjqR8vpNhXseldSn18SLeBs4/bCfg5P3TXh75qnyeUZ9XbEcIHd5q8TSsp/IkR5pq5vssYMxGwCsZV252NfVc6Q3YZNIyl7q54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768068296; c=relaxed/simple;
	bh=z/bkBrVQmCZh5Z1A4qzY3VU/wQvGCsxKdgMjK/YqmtI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lDHmDRN7IqcctXwaSSI4fB95hZ9BJqfIL/qCI6WyGEutNYHrHHTKfOmc7QUngVcFQrFBuMV01BCHLQ7/UxfbG5d81vExq37fIVw25ASHfnWUj83H2xNHZPe1lKM7dv9r15qir9Ua8c60gJ3xiRKUfxKmaE3GcPAFXrvaPeyfsdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 53911C17EE;
	Sat, 10 Jan 2026 18:04:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 9C1D344;
	Sat, 10 Jan 2026 18:04:50 +0000 (UTC)
Message-ID: <5770eef8d028b4e1778ccee21433ac753e439223.camel@perches.com>
Subject: Re: [PATCH v10 loongarch-next 3/3] LoongArch: Replace seq_printf
 with seq_puts for simple strings
From: Joe Perches <joe@perches.com>
To: George Guo <dongtai.guo@linux.dev>, chenhuacai@kernel.org
Cc: guodongtai@kylinos.cn, hengqi.chen@gmail.com, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, 	r@hev.cc, xry111@xry111.site
Date: Sat, 10 Jan 2026 10:04:49 -0800
In-Reply-To: <20260110131124.99866-4-dongtai.guo@linux.dev>
References: <20260110131124.99866-1-dongtai.guo@linux.dev>
	 <20260110131124.99866-4-dongtai.guo@linux.dev>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: 3w7utxkpjhj7wx8q6y8gskgqaw9j9z16
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 9C1D344
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+LN4XDI5ueQHQhu2SPQ52+meAYOGmQPMA=
X-HE-Tag: 1768068290-31394
X-HE-Meta: U2FsdGVkX1/+d4zFUvlW2oFNHEiFpc/M2r8fe5oV6S+ulRzPw0MXpqBjxKZgBQcMEfQxGwpoYQGXN3ibhP5SCMLlYsmQyfoBo56YXgSmDDGkg1YJndOjcDjBbNO+6YpqgHawnmkHK64e4ZPO8n/SCpMOOKbnVFBMOl8gKGnd64vFw+XlFHGd2l24bHEkQYYsE2GCLiTW9tCtyQ/6UgWvlo3TyXWDbAwQQrjPhP5ZcJKqazJV/pPBUkzSLEvNZgux2Acjyc2M9JWdQU737VyM8Lkm5NrXxAVpnpnEsOwxMSt5feVT19O8up7LTdD1YYUu

On Sat, 2026-01-10 at 21:11 +0800, George Guo wrote:
> Fix warnings like: "Prefer seq_puts to seq_printf" by checkpatch.pl.
>=20
> Replace seq_printf() calls with seq_puts() in show_cpuinfo()
> when outputting simple constant strings without format specifiers.
>=20
> This improves performance slightly as seq_puts() avoids parsing
> the format string.
[]
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
[]
> @@ -50,33 +50,49 @@ static int show_cpuinfo(struct seq_file *m, void *v)
[]
> -	seq_printf(m, "Features\t\t:");
> -	if (cpu_has_cpucfg)	seq_printf(m, " cpucfg");
> -	if (cpu_has_lam)	seq_printf(m, " lam");
[etc]
> +	seq_puts(m, "Features\t\t:");
> +	if (cpu_has_cpucfg)
> +		seq_puts(m, " cpucfg");
> +	if (cpu_has_lam)
> +		seq_puts(m, " lam");

trivia:

Not sure this is better style as it's fairly difficult to read.

Maybe a macro might help, something like:

#define seq_cpu_feature(m, feature) \
	if (cpu_has_##feature) seq_puts(m, " " #feature)

	seq_cpu_feature(m, cpucfg);
	seq_cpu_feature(m, lam);

etc.
